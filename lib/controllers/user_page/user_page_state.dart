
import 'package:eec_app/models/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_page_state.freezed.dart';


@freezed
class UserPageState with _$UserPageState {
  factory UserPageState({
    required UserModel user,
  }) = _UserPageState;
	
}
