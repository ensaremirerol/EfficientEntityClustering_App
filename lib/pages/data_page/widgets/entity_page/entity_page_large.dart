part of '../../data_page.dart';

class _EntityPageLarge extends ConsumerWidget {
  const _EntityPageLarge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(entityProvider);
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
                        ref.read(entityProvider.notifier).search(value);
                      },
                      prefixIcon: const Icon(Icons.search),
                    )),
                const Expanded(child: SizedBox()),
                TextButton.icon(
                  onPressed: () {
                    ref.read(entityProvider.notifier).fetchEntities();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh'),
                ),
                TextButton.icon(
                  onPressed: state.selectedEntityIds.isEmpty
                      ? null
                      : () async {
                          final bool? result = await showDialog<bool>(
                              context: context,
                              builder: (context) => DestructiveAlert(
                                    title: 'Delete entity',
                                    content:
                                        'Are you sure you want to delete ${state.selectedEntityIds.length} entity?',
                                    cancelText: 'Cancel',
                                    destructiveText: 'Delete',
                                  ));
                          if (result ?? false) {
                            ref.read(entityProvider.notifier).deleteSelected();
                          }
                        },
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                ),
                TextButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const _AddEntityDialog());
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
          _EntityDataTable(),
          const Divider(indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Total: ${state.entityList.length}'),
                    const VerticalDivider(
                      width: 16,
                    ),
                    Text('Selected: ${state.selectedEntityIds.length}'),
                    const VerticalDivider(
                      width: 16,
                    ),
                    Text(
                      'In cluster: ${state.entityList.where((e) => e.in_cluster).length}',
                    ),
                    const VerticalDivider(
                      width: 16,
                    ),
                    Text(
                      'Not in cluster: ${state.entityList.where((e) => !e.in_cluster).length}',
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
