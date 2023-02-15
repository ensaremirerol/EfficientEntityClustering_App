import 'package:eec_app/controllers/data_page/entity_page/entity_page_state.dart';
import 'package:eec_app/models/entity_model/entity_model.dart';
import 'package:eec_app/repositories/entity_repository/entity_repository.dart';
import 'package:eec_app/services/csv_service/csv_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntityPageController extends StateNotifier<EntityPageState> {
  EntityPageController({
    required this.ref,
  }) : super(EntityPageState(
            entityList:
                InstanceController().getByType<EntityRepository>().entities,
            isLoading: false,
            searchQuery: null,
            sortColumnIndex: null,
            isAscending: null,
            selectedEntityIds: {}));

  final Ref ref;

  final EntityRepository _entityRepository =
      InstanceController().getByType<EntityRepository>();

  Future<void> fetchEntities() async {
    state = state.copyWith(isLoading: true);
    await _entityRepository.refresh();
    state = state.copyWith(
      entityList: _entityRepository.entities,
      isLoading: false,
    );
  }

  void selectAll() {
    state = state.copyWith(
        selectedEntityIds: state.entityList.map((e) => e.entity_id).toSet());
  }

  void deselectAll() {
    state = state.copyWith(selectedEntityIds: {});
  }

  void selectEntity(String entityId) {
    state = state
        .copyWith(selectedEntityIds: {...state.selectedEntityIds, entityId});
  }

  void deselectEntity(String entityId) {
    final selectedEntityIds = {...state.selectedEntityIds};
    selectedEntityIds.remove(entityId);
    state = state.copyWith(selectedEntityIds: selectedEntityIds);
  }

  void search(String? query) {
    if (query?.isEmpty ?? true) {
      state = state.copyWith(
          searchQuery: null, entityList: _entityRepository.entities);
      return;
    }
    final filteredList = _entityRepository.entities
        .where((e) => e.mention.contains(query!))
        .toList();

    state = state.copyWith(searchQuery: query, entityList: filteredList);
  }

  void sortBy(bool ascending, int columnIndex,
      int Function(EntityModel e1, EntityModel e2) compare) {
    final sortedList = [...state.entityList];
    sortedList.sort(compare);
    state = state.copyWith(
        sortColumnIndex: columnIndex,
        isAscending: ascending,
        entityList: sortedList);
  }

  void deleteEntity(String entityId) async {
    await _entityRepository.deleteEntity(entityId);
    final selectedEntityIds = {...state.selectedEntityIds};
    if (selectedEntityIds.contains(entityId)) {
      selectedEntityIds.remove(entityId);
    }
    state = state.copyWith(
        entityList: _entityRepository.entities,
        selectedEntityIds: selectedEntityIds);
  }

  void deleteSelected() async {
    await _entityRepository.deleteEntities(state.selectedEntityIds);
    state = state.copyWith(
        entityList: _entityRepository.entities, selectedEntityIds: {});
  }

  Future<bool> addEntity(String mention, String source, String sourceId) async {
    try {
      await _entityRepository.addEntity(mention, source, sourceId);
    } catch (e) {
      return false;
    }
    state = state.copyWith(entityList: _entityRepository.entities);
    return true;
  }

  Future<bool> addEntitiesFromCsv(CsvModel csvModel, String idColumn,
      String mentionColumn, String entitySource) async {
    try {
      final idIndex = csvModel.headers.indexOf(idColumn);
      final mentionIndex = csvModel.headers.indexOf(mentionColumn);
      final ids = csvModel.rows.map((e) => '${e[idIndex]}').toList();
      final mentions = csvModel.rows.map((e) => '${e[mentionIndex]}').toList();

      for (final id in ids) {
        if (id.isEmpty) {
          throw Exception('There is at least one empty id');
        }
      }

      for (final mention in mentions) {
        if (mention.isEmpty) {
          throw Exception('There is at least one empty mention');
        }
      }
      await _entityRepository.addEntities(mentions, entitySource, ids);
    } on Exception catch (e) {
      InstanceController()
          .getByType<SnackBarService>()
          .showErrorMessage(e.toString());
      return false;
    }

    state = state.copyWith(entityList: _entityRepository.entities);
    return true;
  }
}
