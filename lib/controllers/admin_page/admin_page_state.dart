import 'package:eec_app/models/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_page_state.freezed.dart';

@freezed
class AdminPageState with _$AdminPageState {
  factory AdminPageState({
    required List<UserModel> users,
    required List<String> selectedUserIds,
    required int? selectedColumnIndex,
    required bool? isAscending,
    required int tablePage,
    required int tableRowsPerPage,
  }) = _AdminPageState;
}
