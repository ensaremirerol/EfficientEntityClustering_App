import 'package:eec_app/controllers/admin_page/admin_page_state.dart';
import 'package:eec_app/models/user_model/user_model.dart';
import 'package:eec_app/repositories/user_repository/user_repository.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminPageController extends StateNotifier<AdminPageState> {
  AdminPageController()
      : super(AdminPageState(
          users: InstanceController().getByType<UserRepository>().users,
          selectedUserIds: [],
          selectedColumnIndex: null,
          isAscending: null,
          tablePage: 0,
          tableRowsPerPage: 10,
        ));

  final UserRepository userRepository =
      InstanceController().getByType<UserRepository>();
  final SnackBarService snackbarService =
      InstanceController().getByType<SnackBarService>();

  void refresh() async {
    snackbarService.showInfoMessage('Refreshing...');
    final List<Future> futures = [
      userRepository.refresh(),
      userRepository.getCurrentUser()
    ];

    await Future.wait(futures);

    state = state.copyWith(
      users: userRepository.users,
    );
    snackbarService.showSuccessMessage('Refreshed', clear: true);
  }

  void changeUsername(
    String userId,
    String newUsername,
    String password,
  ) async {
    snackbarService.showInfoMessage('Changing username...');

    await userRepository.updateUsername(userId, newUsername, password);

    state = state.copyWith(
      users: userRepository.users,
    );
    snackbarService.showSuccessMessage('Username changed', clear: true);
  }

  void changePassword(
    String userId,
    String newPassword,
  ) async {
    snackbarService.showInfoMessage('Changing password...');

    await userRepository.updatePassword(userId, '', newPassword);

    state = state.copyWith(
      users: userRepository.users,
    );
    snackbarService.showSuccessMessage('Password changed', clear: true);
  }

  void changeScopes(String userId, List<String> scopes) async {
    snackbarService.showInfoMessage('Changing scopes...');
    await userRepository.updateScopes(userId, scopes);

    state = state.copyWith(
      users: userRepository.users,
    );

    snackbarService.showSuccessMessage('Scopes changed', clear: true);
  }

  void deleteUser(String userId) async {
    snackbarService.showInfoMessage('Deleting user...');
    await userRepository.deleteUser(userId);
    state = state.copyWith(
      users: userRepository.users,
    );
    snackbarService.showSuccessMessage('User deleted', clear: true);
  }

  void deleteSelectedUsers() async {
    snackbarService.showInfoMessage('Deleting users...');
    final List<Future> futures = [];
    for (final userId in state.selectedUserIds) {
      futures.add(userRepository.deleteUser(userId));
    }

    await Future.wait(futures);

    state = state.copyWith(
      users: userRepository.users,
    );
    snackbarService.showSuccessMessage('Users deleted', clear: true);
  }

  void selectAll() {
    state = state.copyWith(
      selectedUserIds: state.users.map((e) => e.user_id).toList(),
    );
  }

  void selectNone() {
    state = state.copyWith(
      selectedUserIds: [],
    );
  }

  void selectUser(String userId) {
    if (state.selectedUserIds.contains(userId)) {
      state = state.copyWith(
        selectedUserIds: state.selectedUserIds
          ..removeWhere((element) => element == userId),
      );
    } else {
      state = state.copyWith(
        selectedUserIds: state.selectedUserIds..add(userId),
      );
    }
  }

  void sortBy(bool ascending, int columnIndex,
      int Function(UserModel e1, UserModel e2) sortFunc) {
    state = state.copyWith(
      isAscending: ascending,
      selectedColumnIndex: columnIndex,
      users: userRepository.users
        ..sort((e1, e2) {
          if (ascending) {
            return sortFunc(e1, e2);
          } else {
            return sortFunc(e2, e1);
          }
        }),
    );
  }

  addUser(String username, String password, List<String> scopes) async {
    snackbarService.showInfoMessage('Adding user...');
    await userRepository.createUser(username, password, scopes);
    state = state.copyWith(
      users: userRepository.users,
    );
    snackbarService.showSuccessMessage('User added', clear: true);
  }

  void setPageSize(int pageSize) {
    final currentFirstRowIndex = state.tablePage * state.tableRowsPerPage;
    final page = currentFirstRowIndex ~/ pageSize;
    state = state.copyWith(tableRowsPerPage: pageSize, tablePage: page);
  }

  void setPage(int page) {
    state = state.copyWith(tablePage: page);
  }
}
