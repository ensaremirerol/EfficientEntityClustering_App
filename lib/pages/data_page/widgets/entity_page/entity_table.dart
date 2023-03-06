part of '../../data_page.dart';

class _EntityDataTable extends ConsumerWidget {
  const _EntityDataTable();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(entityProvider);
    return Expanded(
        child: SingleChildScrollView(
      primary: true,
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        primary: true,
        child: state.entityList.isEmpty
            ? Center(
                child: const Text('no_data').tr(),
              )
            : SelectionArea(
                child: DataTable(
                    onSelectAll: (value) {
                      if (value ?? false) {
                        ref.read(entityProvider.notifier).selectAll();
                      } else {
                        ref.read(entityProvider.notifier).deselectAll();
                      }
                    },
                    sortColumnIndex: state.sortColumnIndex,
                    sortAscending: state.isAscending ?? true,
                    columns: [
                      DataColumn(
                          label: const Text('entity_id').tr(),
                          onSort: (columnIndex, ascending) {
                            if (ascending) {
                              ref.read(entityProvider.notifier).sortBy(
                                  ascending,
                                  columnIndex,
                                  (e1, e2) => int.parse(e2.entity_id)
                                      .compareTo(int.parse(e1.entity_id)));
                            } else {
                              ref.read(entityProvider.notifier).sortBy(
                                  ascending,
                                  columnIndex,
                                  (e1, e2) => int.parse(e1.entity_id)
                                      .compareTo(int.parse(e2.entity_id)));
                            }
                          }),
                      DataColumn(
                          label: const Text('entity_mention').tr(),
                          onSort: (columnIndex, ascending) {
                            if (ascending) {
                              ref.read(entityProvider.notifier).sortBy(
                                  ascending,
                                  columnIndex,
                                  (e1, e2) => e2.mention.compareTo(e1.mention));
                            } else {
                              ref.read(entityProvider.notifier).sortBy(
                                  ascending,
                                  columnIndex,
                                  (e1, e2) => e1.mention.compareTo(e2.mention));
                            }
                          }),
                      DataColumn(
                          label: const Text('entity_source').tr(),
                          onSort: (columnIndex, ascending) {
                            if (ascending) {
                              ref.read(entityProvider.notifier).sortBy(
                                  ascending,
                                  columnIndex,
                                  (e1, e2) => e2.entity_source
                                      .compareTo(e1.entity_source));
                            } else {
                              ref.read(entityProvider.notifier).sortBy(
                                  ascending,
                                  columnIndex,
                                  (e1, e2) => e1.entity_source
                                      .compareTo(e2.entity_source));
                            }
                          }),
                      DataColumn(
                        label: const Text('entity_source_id').tr(),
                      ),
                      DataColumn(label: const Text('entity_in_cluster').tr()),
                      DataColumn(label: const Text('cluster_id').tr()),
                      DataColumn(
                          label: const Text('entity_has_mention_vector').tr()),
                      DataColumn(label: const Text('delete').tr()),
                    ],
                    rows: state.entityList
                        .skip(state.tablePage * state.tableRowsPerPage)
                        .take(state.tableRowsPerPage)
                        .map((e) => DataRow(
                                selected: state.selectedEntityIds
                                    .contains(e.entity_id),
                                onSelectChanged: (value) {
                                  if (value ?? false) {
                                    ref
                                        .read(entityProvider.notifier)
                                        .selectEntity(e.entity_id);
                                  } else {
                                    ref
                                        .read(entityProvider.notifier)
                                        .deselectEntity(e.entity_id);
                                  }
                                },
                                cells: [
                                  DataCell(Text(e.entity_id)),
                                  DataCell(Text(e.mention)),
                                  DataCell(Text(e.entity_source)),
                                  DataCell(Text(e.entity_source_id)),
                                  DataCell(Text(
                                      e.has_cluster ? 'yes'.tr() : 'no'.tr())),
                                  DataCell(Text(e.cluster_id), onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (context) => _EditClusterDialog(
                                          entityId: e.entity_id,
                                          clusterId: e.cluster_id),
                                    );
                                    ref
                                        .read(entityProvider.notifier)
                                        .fetchEntities();
                                  }),
                                  DataCell(Text(e.has_mention_vector
                                      ? 'yes'.tr()
                                      : 'no'.tr())),
                                  DataCell(
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () async {
                                        final bool? result =
                                            await showDialog<bool>(
                                                context: context,
                                                builder: (context) =>
                                                    DestructiveAlert(
                                                      title:
                                                          'delete_entity'.tr(),
                                                      content:
                                                          'delete_entity_confirm'
                                                              .tr(),
                                                      cancelText: 'cancel'.tr(),
                                                      destructiveText:
                                                          'delete'.tr(),
                                                    ));
                                        if (result ?? false) {
                                          ref
                                              .read(entityProvider.notifier)
                                              .deleteEntity(e.entity_id);
                                        }
                                      },
                                    ),
                                  )
                                ]))
                        .toList()),
              ),
      ),
    ));
  }
}
