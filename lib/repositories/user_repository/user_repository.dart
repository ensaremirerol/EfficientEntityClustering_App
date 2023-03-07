import 'package:eec_app/models/user_model/user_model.dart';
import 'package:eec_app/services/API_service/api_calls/user/create_user.dart';
import 'package:eec_app/services/API_service/api_calls/user/delete_user.dart';
import 'package:eec_app/services/API_service/api_calls/user/get_all_users.dart';
import 'package:eec_app/services/API_service/api_calls/user/get_current_user.dart';
import 'package:eec_app/services/API_service/api_calls/user/update_password.dart';
import 'package:eec_app/services/API_service/api_calls/user/update_scopes.dart';
import 'package:eec_app/services/API_service/api_calls/user/update_username.dart';
import 'package:eec_app/services/API_service/api_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:logger/logger.dart';

class UserRepository {
  final APIService apiService = InstanceController().getByType<APIService>();

  final Logger _logger = Logger();

  UserModel? _user;

  UserModel? get user => _user;

  final List<UserModel> _users = [];

  List<UserModel> get users => [..._users];

  final SnackBarService _snackBarService =
      InstanceController().getByType<SnackBarService>();

  Future<void> refresh() async {
    try {
      final response = await apiService.call(const GetAllUsers(), null);
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        _users.clear();
        _users
            .addAll((response.data as List).map((e) => UserModel.fromJson(e)));
        await getCurrentUser();
      } else {
        _logger.e('Response data is null');
        _logger.e(response);
        if (response.data['detail'] != null) {
          _snackBarService.showErrorMessage(
              'Error while refreshing UserRepository:\n${response.data['detail']}');
        } else {
          _snackBarService.showErrorMessage(
              'Error while refreshing UserRepository:\n${response.statusCode}');
        }
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while refreshing UserRepository');
      _logger.e(e);
    }
  }

  Future<void> getCurrentUser() async {
    try {
      final response = await apiService.call(const GetCurrentUser(), null);
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        _user = UserModel.fromJson(response.data);
      } else {
        _logger.e('Response data is null');
        _logger.e(response);
        if (response.data['detail'] != null) {
          _snackBarService.showErrorMessage(
              'Error while getting current user:\n${response.data['detail']}');
        } else {
          _snackBarService.showErrorMessage(
              'Error while getting current user:\n${response.statusCode}');
        }
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while getting current user');
      _logger.e(e);
    }
  }

  Future<void> updateUsername(
    String userid,
    String username,
    String password,
  ) async {
    try {
      final response = await apiService.call(
          const UpdateUsername(),
          UpdateUsernameArgs(
              id: userid, newUsername: username, password: password));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        await apiService.getToken(username, password);
        await refresh();
      } else {
        _logger.e('Response data is null');
        _logger.e(response);
        if (response.data['detail'] != null) {
          _snackBarService.showErrorMessage(
              'Error while updating username:\n${response.data['detail']}');
        } else {
          _snackBarService.showErrorMessage(
              'Error while updating username:\n${response.statusCode}');
        }
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while updating username');
      _logger.e(e);
    }
  }

  Future<void> updatePassword(
    String userid,
    String oldPassword,
    String newPassword,
  ) async {
    try {
      final response = await apiService.call(
          const UpdatePassword(),
          UpdatePasswordArgs(
              id: userid, oldPassword: oldPassword, newPassword: newPassword));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        await refresh();
      } else {
        _logger.e('Response data is null');
        _logger.e(response);
        if (response.data['detail'] != null) {
          _snackBarService.showErrorMessage(
              'Error while updating password:\n${response.data['detail']}');
        } else {
          _snackBarService.showErrorMessage(
              'Error while updating password:\n${response.statusCode}');
        }
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while updating password');
      _logger.e(e);
      rethrow;
    }
  }

  Future<void> updateScopes(
    String userid,
    List<String> scopes,
  ) async {
    try {
      final response = await apiService.call(
          const UpdateScopes(), UpdateScopesArgs(id: userid, scopes: scopes));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        await refresh();
      } else {
        _logger.e('Response data is null');
        _logger.e(response);
        if (response.data['detail'] != null) {
          _snackBarService.showErrorMessage(
              'Error while updating scopes:\n${response.data['detail']}');
        } else {
          _snackBarService.showErrorMessage(
              'Error while updating scopes:\n${response.statusCode}');
        }
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while updating scopes');
      _logger.e(e);
      rethrow;
    }
  }

  Future<void> createUser(
    String username,
    String password,
    List<String> scopes,
  ) async {
    try {
      final response = await apiService.call(
          const CreateUser(),
          CreateUserArgs(
              username: username, password: password, scopes: scopes));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        await refresh();
      } else {
        _logger.e('Response data is null');
        _logger.e(response);
        if (response.data['detail'] != null) {
          _snackBarService.showErrorMessage(
              'Error while creating user:\n${response.data['detail']}');
        } else {
          _snackBarService.showErrorMessage(
              'Error while creating user:\n${response.statusCode}');
        }
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while creating user');
      _logger.e(e);
      rethrow;
    }
  }

  void reset() {
    _user = null;
    _users.clear();
  }

  Future<void> deleteUser(String userid) async {
    try {
      final response =
          await apiService.call(const DeleteUser(), DeleteUserArgs(id: userid));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        await refresh();
      } else {
        _logger.e('Response data is null');
        _logger.e(response);
        if (response.data['detail'] != null) {
          _snackBarService.showErrorMessage(
              'Error while deleting user:\n${response.data['detail']}');
        } else {
          _snackBarService.showErrorMessage(
              'Error while deleting user:\n${response.statusCode}');
        }
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while deleting user');
      _logger.e(e);
      rethrow;
    }
  }
}
