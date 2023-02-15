part of '../../data_page.dart';

class _EntityDataTable extends ConsumerWidget {
  const _EntityDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(entityProvider);
    return Expanded(
        child: SingleChildScrollView(
      primary: true,
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        primary: true,
        scrollDirection: Axis.vertical,
        child: state.entityList.isEmpty
            ? Center(
                child: Text('No data'),
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
                    showCheckboxColumn: true,
                    sortColumnIndex: state.sortColumnIndex,
                    sortAscending: state.isAscending ?? true,
                    showBottomBorder: true,
                    columns: [
                      DataColumn(
                          label: Text('entity_id'),
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
                          label: Text('mention'),
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
                          label: Text('entity_source'),
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
                        label: Text('entity_source_id'),
                      ),
                      DataColumn(label: Text('in_cluster')),
                      DataColumn(label: Text('cluster_id')),
                      DataColumn(label: Text('has_mention_vector')),
                      DataColumn(label: Text('Delete')),
                    ],
                    rows: state.entityList
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
                                  DataCell(Text(e.in_cluster ? 'yes' : 'no')),
                                  DataCell(
                                    Text(e.cluster_id),
                                  ),
                                  DataCell(Text(
                                      e.has_mention_vector ? 'yes' : 'no')),
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
                                                      title: 'Delete entity',
                                                      content:
                                                          'Are you sure you want to delete this entity?',
                                                      cancelText: 'Cancel',
                                                      destructiveText: 'Delete',
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
