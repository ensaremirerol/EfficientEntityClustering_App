part of '../../data_page.dart';

class _ClusterPageLarge extends ConsumerWidget {
  const _ClusterPageLarge(
      {required this.onSearch,
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
              children: [
                SizedBox(
                    width: 300,
                    child: CustomTextField(
                      hintText: 'search'.tr(),
                      onChanged: onSearch,
                      prefixIcon: const Icon(Icons.search),
                    )),
                const Expanded(child: SizedBox()),
                TextButton.icon(
                  onPressed: onRefresh,
                  icon: const Icon(Icons.refresh),
                  label: const Text('refresh').tr(),
                ),
                TextButton.icon(
                  onPressed: state.selectedClusterIds.isEmpty
                      ? null
                      : onDeleteSelected,
                  icon: const Icon(Icons.delete),
                  label: const Text('delete').tr(),
                ),
                TextButton.icon(
                    onPressed: onAdd,
                    icon: const Icon(Icons.add),
                    label: const Text('add').tr()),
                TextButton.icon(
                    onPressed: onImport,
                    icon: const Icon(Icons.document_scanner),
                    label: const Text('import').tr()),
                TextButton.icon(
                    onPressed: onExport,
                    icon: const Icon(Icons.download),
                    label: const Text('export').tr()),
              ],
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          const _ClusterDataTable(),
          const Divider(indent: 16, endIndent: 16),
          const _ClusterTableFoot(),
        ],
      ),
    );
  }
}
