import 'package:eec_app/models/data_models/api_entity_in/api_entity_in.dart';
import 'package:eec_app/models/entity_model/entity_model.dart';
import 'package:eec_app/services/API_service/api_calls/entity/create_entities.dart';
import 'package:eec_app/services/API_service/api_calls/entity/create_entity.dart';
import 'package:eec_app/services/API_service/api_calls/entity/delete_entities.dart';
import 'package:eec_app/services/API_service/api_calls/entity/delete_entity.dart';
import 'package:eec_app/services/API_service/api_calls/entity/export_all_entities.dart';
import 'package:eec_app/services/API_service/api_calls/entity/get_all_entities.dart';
import 'package:eec_app/services/API_service/api_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:logger/logger.dart';

class EntityRepository {
  final APIService apiService = InstanceController().getByType<APIService>();

  final List<EntityModel> _entities = [];

  List<EntityModel> get entities => [..._entities];

  final Logger _logger = Logger();

  Future<void> refresh() async {
    _logger.i('Refreshing EntityRepository');
    try {
      final response = await apiService.call(const GetAllEntities(), null);
      if (response.data != null) {
        _entities.clear();
        _entities.addAll(
            (response.data as List).map((e) => EntityModel.fromJson(e)));
      } else {
        _logger.e('Response data is null');
        _logger.e(response);
        if (response.data != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while refreshing EntityRepository:\n${response.data['detail']}');
        } else {
          InstanceController()
              .getByType<SnackBarService>()
              .showErrorMessage('Error while refreshing EntityRepository');
        }
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while refreshing EntityRepository');
      _logger.e(e);
    }
  }

  Future<void> deleteEntity(String entityId) async {
    _logger.i('Deleting entity with id $entityId');
    try {
      final response = await apiService.call(
          const DeleteEntity(), DeleteEntityArgs(id: entityId));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        _entities.removeWhere((element) => element.entity_id == entityId);
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data['detail'] != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while deleting entity with id $entityId:\n${response.data['detail']}');
        } else {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while deleting entity with id $entityId');
        }
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while deleting entity with id $entityId');
      _logger.e(e);
    }
  }

  Future<void> deleteEntities(Set<String> selectedEntityIds) async {
    _logger.i('Deleting entities with ids $selectedEntityIds');
    try {
      final response = await apiService.call(const DeleteEntities(),
          DeleteEntitiesArgs(ids: selectedEntityIds.toList(growable: false)));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        _entities.removeWhere(
            (element) => selectedEntityIds.contains(element.entity_id));
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data['detail'] != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while deleting entities with ids $selectedEntityIds:\n${response.data['detail']}');
        } else {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while deleting entities with ids $selectedEntityIds');
        }
        throw Exception('Response status code is not 200');
      }
    } catch (e) {
      _logger.e('Error while deleting entities with ids $selectedEntityIds');
      _logger.e(e);
    }
  }

  Future<void> addEntity(String mention, String source, String sourceId) async {
    _logger.i(
        'Adding entity with mention $mention, source $source and sourceId $sourceId');
    try {
      final response = await apiService.call(
          const CreateEntity(),
          CreateEntityArgs(
              entity: ApiEntityIn(
                  entity_id: '-1',
                  entity_source: source,
                  entity_source_id: sourceId,
                  mention: mention)));
      if (response.statusCode == 200 || response.statusCode == 201) {
        _entities.add(EntityModel.fromJson(response.data));
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data['detail'] != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while adding entity with mention $mention:\n${response.data['detail']}');
        } else {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while adding entity with mention $mention');
        }
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while adding entity with mention $mention');
      _logger.e(e);
      rethrow;
    }
  }

  Future<void> addEntities(
      List<String> mentions, String source, List<String> sourceIds) async {
    _logger.i('Adding Multiple entities!');
    try {
      final response = await apiService.call(
          const CreateEntities(),
          CreateEntitiesArgs(
            entities: List.generate(
              mentions.length,
              (index) => ApiEntityIn(
                entity_id: '-1',
                entity_source: source,
                entity_source_id: sourceIds[index],
                mention: mentions[index],
              ),
            ),
          ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        _entities.addAll(
            (response.data as List).map((e) => EntityModel.fromJson(e)));
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data['detail'] != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while adding entities:\n${response.data['detail']}');
        } else {
          InstanceController()
              .getByType<SnackBarService>()
              .showErrorMessage('Error while adding entities}');
        }
      }
    } on Exception catch (e) {
      _logger.e('Error while adding entities');
      _logger.e(e);
      rethrow;
    }
  }

  Future<String> exportAll() async {
    try {
      final response = await apiService.call(const ExportAllEntites(), null);
      if (response.statusCode == 200) {
        return response.data!;
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data['detail'] != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while exporting entities:\n${response.data['detail']}');
        } else {
          InstanceController()
              .getByType<SnackBarService>()
              .showErrorMessage('Error while exporting entities');
        }
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while exporting entities');
      _logger.e(e);
      rethrow;
    }
  }

  void dispose(){
    _entities.clear();
  }
}
