import 'package:eec_app/models/entity_model/entity_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_page_state.freezed.dart';

@freezed
class EntityPageState with _$EntityPageState {
  factory EntityPageState({
    required List<EntityModel> entityList,
    required Set<String> selectedEntityIds,
    required int tablePage,
    required int tableRowsPerPage,
    required String? searchQuery,
    required int? sortColumnIndex,
    required bool? isAscending,
    required bool isLoading,
  }) = _EntityPageState;
}
