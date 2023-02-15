part of '../../data_page.dart';

class _ClusterPageSmall extends ConsumerWidget {
  const _ClusterPageSmall(
      {super.key,
      required this.onSearch,
      required this.onRefresh,
      required this.onImport,
      required this.onAdd,
      required this.onDeleteSelected,
      required this.onExport});

  final void Function(String? value) onSearch;
  final void Function() onRefresh;
  final void Function() onImport;
  final void Function() onExport;
  final void Function() onAdd;
  final void Function() onDeleteSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clusterProvider);
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 300,
                    child: CustomTextField(
                      hintText: 'Search',
                      onChanged: onSearch,
                      prefixIcon: const Icon(Icons.search),
                    )),
                const Expanded(child: SizedBox()),
                PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('Refresh'),
                            onTap: onRefresh,
                          ),
                          PopupMenuItem(
                            child: Text('Delete selected'),
                            enabled: state.selectedClusterIds.isNotEmpty,
                            onTap: onDeleteSelected,
                          ),
                          PopupMenuItem(
                            child: Text('Add'),
                            onTap: onAdd,
                          ),
                          PopupMenuItem(
                            child: Text('Import'),
                            onTap: onImport,
                            value: 'import',
                          ),
                          PopupMenuItem(
                            child: Text('Export'),
                            onTap: onExport,
                            value: 'export',
                          ),
                        ]),
              ],
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          _ClusterDataTable(),
          const Divider(indent: 16, endIndent: 16),
          _ClusterTableFoot(),
        ],
      ),
    );
  }
}
