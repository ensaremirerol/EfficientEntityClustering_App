part of '../../data_page.dart';

class _ClusterDataTable extends ConsumerWidget {
  const _ClusterDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clusterProvider);
    return Expanded(
      child: SingleChildScrollView(
        primary: true,
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          primary: true,
          scrollDirection: Axis.vertical,
          child: state.clusterList.isEmpty
              ? Center(
                  child: Text('No data'),
                )
              : SelectionArea(
                  child: DataTable(
                      onSelectAll: (value) {
                        if (value ?? false) {
                          ref.read(clusterProvider.notifier).selectAll();
                        } else {
                          ref.read(clusterProvider.notifier).deselectAll();
                        }
                      },
                      showCheckboxColumn: true,
                      sortColumnIndex: state.sortColumnIndex,
                      sortAscending: state.isAscending ?? true,
                      columns: [
                        DataColumn(
                            label: Text('cluster_id'),
                            onSort: (columnIndex, ascending) {
                              if (ascending) {
                                ref.read(clusterProvider.notifier).sortBy(
                                    ascending,
                                    columnIndex,
                                    (e1, e2) => int.parse(e2.cluster_id)
                                        .compareTo(int.parse(e1.cluster_id)));
                              } else {
                                ref.read(clusterProvider.notifier).sortBy(
                                    ascending,
                                    columnIndex,
                                    (e1, e2) => int.parse(e1.cluster_id)
                                        .compareTo(int.parse(e2.cluster_id)));
                              }
                            }),
                        DataColumn(
                            label: Text('cluster_name'),
                            onSort: (columnIndex, ascending) {
                              if (ascending) {
                                ref.read(clusterProvider.notifier).sortBy(
                                    ascending,
                                    columnIndex,
                                    (e1, e2) => e2.cluster_name
                                        .compareTo(e1.cluster_name));
                              } else {
                                ref.read(clusterProvider.notifier).sortBy(
                                    ascending,
                                    columnIndex,
                                    (e1, e2) => e1.cluster_name
                                        .compareTo(e2.cluster_name));
                              }
                            }),
                        DataColumn(
                            label: Text('entity_count'),
                            onSort: (columnIndex, ascending) {
                              if (ascending) {
                                ref.read(clusterProvider.notifier).sortBy(
                                    ascending,
                                    columnIndex,
                                    (e1, e2) => e2.entity_ids.length
                                        .compareTo(e1.entity_ids.length));
                              } else {
                                ref.read(clusterProvider.notifier).sortBy(
                                    ascending,
                                    columnIndex,
                                    (e1, e2) => e1.entity_ids.length
                                        .compareTo(e2.entity_ids.length));
                              }
                            }),
                        DataColumn(label: Text('Delete')),
                      ],
                      rows: state.clusterList
                          .map((e) => DataRow(
                                  selected: state.selectedClusterIds
                                      .contains(e.cluster_id),
                                  onSelectChanged: (value) {
                                    if (value ?? false) {
                                      ref
                                          .read(clusterProvider.notifier)
                                          .selectCluster(e.cluster_id);
                                    } else {
                                      ref
                                          .read(clusterProvider.notifier)
                                          .deselectCluster(e.cluster_id);
                                    }
                                  },
                                  cells: [
                                    DataCell(Text(e.cluster_id)),
                                    DataCell(Text(e.cluster_name)),
                                    DataCell(
                                        Text(e.entity_ids.length.toString())),
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
                                                        title: 'Delete cluster',
                                                        content:
                                                            'Are you sure you want to delete this cluster?',
                                                        cancelText: 'Cancel',
                                                        destructiveText:
                                                            'Delete',
                                                      ));
                                          if (result ?? false) {
                                            ref
                                                .read(clusterProvider.notifier)
                                                .deleteCluster(e.cluster_name);
                                          }
                                        },
                                      ),
                                    )
                                  ]))
                          .toList()),
                ),
        ),
      ),
    );
  }
}
