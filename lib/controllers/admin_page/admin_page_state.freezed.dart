// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdminPageState {
  List<UserModel> get users => throw _privateConstructorUsedError;
  List<String> get selectedUserIds => throw _privateConstructorUsedError;
  int? get selectedColumnIndex => throw _privateConstructorUsedError;
  bool? get isAscending => throw _privateConstructorUsedError;
  int get tablePage => throw _privateConstructorUsedError;
  int get tableRowsPerPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminPageStateCopyWith<AdminPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminPageStateCopyWith<$Res> {
  factory $AdminPageStateCopyWith(
          AdminPageState value, $Res Function(AdminPageState) then) =
      _$AdminPageStateCopyWithImpl<$Res, AdminPageState>;
  @useResult
  $Res call(
      {List<UserModel> users,
      List<String> selectedUserIds,
      int? selectedColumnIndex,
      bool? isAscending,
      int tablePage,
      int tableRowsPerPage});
}

/// @nodoc
class _$AdminPageStateCopyWithImpl<$Res, $Val extends AdminPageState>
    implements $AdminPageStateCopyWith<$Res> {
  _$AdminPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? selectedUserIds = null,
    Object? selectedColumnIndex = freezed,
    Object? isAscending = freezed,
    Object? tablePage = null,
    Object? tableRowsPerPage = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      selectedUserIds: null == selectedUserIds
          ? _value.selectedUserIds
          : selectedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedColumnIndex: freezed == selectedColumnIndex
          ? _value.selectedColumnIndex
          : selectedColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isAscending: freezed == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool?,
      tablePage: null == tablePage
          ? _value.tablePage
          : tablePage // ignore: cast_nullable_to_non_nullable
              as int,
      tableRowsPerPage: null == tableRowsPerPage
          ? _value.tableRowsPerPage
          : tableRowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdminPageStateCopyWith<$Res>
    implements $AdminPageStateCopyWith<$Res> {
  factory _$$_AdminPageStateCopyWith(
          _$_AdminPageState value, $Res Function(_$_AdminPageState) then) =
      __$$_AdminPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserModel> users,
      List<String> selectedUserIds,
      int? selectedColumnIndex,
      bool? isAscending,
      int tablePage,
      int tableRowsPerPage});
}

/// @nodoc
class __$$_AdminPageStateCopyWithImpl<$Res>
    extends _$AdminPageStateCopyWithImpl<$Res, _$_AdminPageState>
    implements _$$_AdminPageStateCopyWith<$Res> {
  __$$_AdminPageStateCopyWithImpl(
      _$_AdminPageState _value, $Res Function(_$_AdminPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? selectedUserIds = null,
    Object? selectedColumnIndex = freezed,
    Object? isAscending = freezed,
    Object? tablePage = null,
    Object? tableRowsPerPage = null,
  }) {
    return _then(_$_AdminPageState(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      selectedUserIds: null == selectedUserIds
          ? _value._selectedUserIds
          : selectedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedColumnIndex: freezed == selectedColumnIndex
          ? _value.selectedColumnIndex
          : selectedColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isAscending: freezed == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool?,
      tablePage: null == tablePage
          ? _value.tablePage
          : tablePage // ignore: cast_nullable_to_non_nullable
              as int,
      tableRowsPerPage: null == tableRowsPerPage
          ? _value.tableRowsPerPage
          : tableRowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AdminPageState implements _AdminPageState {
  _$_AdminPageState(
      {required final List<UserModel> users,
      required final List<String> selectedUserIds,
      required this.selectedColumnIndex,
      required this.isAscending,
      required this.tablePage,
      required this.tableRowsPerPage})
      : _users = users,
        _selectedUserIds = selectedUserIds;

  final List<UserModel> _users;
  @override
  List<UserModel> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<String> _selectedUserIds;
  @override
  List<String> get selectedUserIds {
    if (_selectedUserIds is EqualUnmodifiableListView) return _selectedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedUserIds);
  }

  @override
  final int? selectedColumnIndex;
  @override
  final bool? isAscending;
  @override
  final int tablePage;
  @override
  final int tableRowsPerPage;

  @override
  String toString() {
    return 'AdminPageState(users: $users, selectedUserIds: $selectedUserIds, selectedColumnIndex: $selectedColumnIndex, isAscending: $isAscending, tablePage: $tablePage, tableRowsPerPage: $tableRowsPerPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdminPageState &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._selectedUserIds, _selectedUserIds) &&
            (identical(other.selectedColumnIndex, selectedColumnIndex) ||
                other.selectedColumnIndex == selectedColumnIndex) &&
            (identical(other.isAscending, isAscending) ||
                other.isAscending == isAscending) &&
            (identical(other.tablePage, tablePage) ||
                other.tablePage == tablePage) &&
            (identical(other.tableRowsPerPage, tableRowsPerPage) ||
                other.tableRowsPerPage == tableRowsPerPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_selectedUserIds),
      selectedColumnIndex,
      isAscending,
      tablePage,
      tableRowsPerPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminPageStateCopyWith<_$_AdminPageState> get copyWith =>
      __$$_AdminPageStateCopyWithImpl<_$_AdminPageState>(this, _$identity);
}

abstract class _AdminPageState implements AdminPageState {
  factory _AdminPageState(
      {required final List<UserModel> users,
      required final List<String> selectedUserIds,
      required final int? selectedColumnIndex,
      required final bool? isAscending,
      required final int tablePage,
      required final int tableRowsPerPage}) = _$_AdminPageState;

  @override
  List<UserModel> get users;
  @override
  List<String> get selectedUserIds;
  @override
  int? get selectedColumnIndex;
  @override
  bool? get isAscending;
  @override
  int get tablePage;
  @override
  int get tableRowsPerPage;
  @override
  @JsonKey(ignore: true)
  _$$_AdminPageStateCopyWith<_$_AdminPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
