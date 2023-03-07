import 'package:eec_app/controllers/user_page/user_page_state.dart';
import 'package:eec_app/repositories/user_repository/user_repository.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:eec_app/utils/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPageController extends StateNotifier<UserPageState> {
  UserPageController(
    this.ref,
  ) : super(UserPageState(
          user: InstanceController().getByType<UserRepository>().user!,
        ));

  final Ref ref;

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
      user: userRepository.user!,
    );
    snackbarService.showSuccessMessage('Refreshed', clear: true);
  }

  void logout(BuildContext context, WidgetRef ref) async {
    restartApp(context, ref);
  }

  void changeUsername(String newUsername, String password,
      {required String? userId}) async {
    snackbarService.showInfoMessage('Changing username...');
    if (userId == null) {
      userId = state.user.user_id;
    }

    await userRepository.updateUsername(userId, newUsername, password);

    state = state.copyWith(
      user: userRepository.user!,
    );
    snackbarService.showSuccessMessage('Username changed', clear: true);
  }

  void changePassword(String oldPassword, String newPassword,
      {String? userId}) async {
    snackbarService.showInfoMessage('Changing password...');
    if (userId == null) {
      userId = state.user.user_id;
    }
    await userRepository.updatePassword(userId, oldPassword, newPassword);

    state = state.copyWith(
      user: userRepository.user!,
    );
    snackbarService.showSuccessMessage('Password changed', clear: true);
  }

  void changeScopes(String userId, List<String> scopes) async {
    snackbarService.showInfoMessage('Changing scopes...');
    await userRepository.updateScopes(userId, scopes);

    state = state.copyWith(
      user: userRepository.user!,
    );
    snackbarService.showSuccessMessage('Scopes changed', clear: true);
  }

  void deleteUser(String userId) async {
    snackbarService.showInfoMessage('Deleting user...');
    await userRepository.deleteUser(userId);
    state = state.copyWith(
      user: userRepository.user!,
    );
    snackbarService.showSuccessMessage('User deleted', clear: true);
  }
}
