part of '../../data_page.dart';

class _ClusterPageLarge extends ConsumerWidget {
  const _ClusterPageLarge({super.key});

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
                      onChanged: (value) {
                        ref.read(clusterProvider.notifier).search(value);
                      },
                      prefixIcon: const Icon(Icons.search),
                    )),
                const Expanded(child: SizedBox()),
                TextButton.icon(
                  onPressed: () {
                    ref.read(clusterProvider.notifier).fetchClusters();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh'),
                ),
                TextButton.icon(
                  onPressed: state.selectedClusterIds.isEmpty
                      ? null
                      : () async {
                          final bool? result = await showDialog<bool>(
                              context: context,
                              builder: (context) => DestructiveAlert(
                                    title: 'Delete cluster',
                                    content:
                                        'Are you sure you want to delete ${state.selectedClusterIds.length} cluster?',
                                    cancelText: 'Cancel',
                                    destructiveText: 'Delete',
                                  ));
                          if (result ?? false) {
                            ref.read(clusterProvider.notifier).deleteSelected();
                          }
                        },
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                ),
                TextButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const _AddClusterDialog());
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add')),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.document_scanner),
                    label: const Text('Import')),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text('Export')),
              ],
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          _ClusterDataTable(),
          const Divider(indent: 16, endIndent: 16),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntrinsicHeight(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Total: ${state.clusterList.length}'),
                      const VerticalDivider(
                        width: 16,
                      ),
                      Text('Selected: ${state.selectedClusterIds.length}'),
                      const VerticalDivider(
                        width: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


