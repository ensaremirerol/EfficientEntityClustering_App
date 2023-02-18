part of '../../data_page.dart';

class _EntityPageMedium extends ConsumerWidget {
  const _EntityPageMedium(
      {required this.onSearch,
      required this.onRefresh,
      required this.onImport,
      required this.onExport,
      required this.onAdd,
      required this.onDeleteSelected});

  final void Function(String? value) onSearch;
  final void Function() onRefresh;
  final void Function() onImport;
  final void Function() onExport;
  final void Function() onAdd;
  final void Function() onDeleteSelected;

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
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text('delete_selected').tr(),
                      enabled: state.selectedEntityIds.isNotEmpty,
                      onTap: state.selectedEntityIds.isEmpty
                          ? null
                          : onDeleteSelected,
                    ),
                    PopupMenuItem(
                      child: const Text('add_entity').tr(),
                      onTap: onAdd,
                    ),
                    PopupMenuItem(
                      child: const Text('import').tr(),
                      onTap: onImport,
                    ),
                    PopupMenuItem(
                      child: const Text('export').tr(),
                      onTap: onExport,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          const _EntityDataTable(),
          const Divider(indent: 16, endIndent: 16),
          const _EntityTableFoot(),
        ],
      ),
    );
  }
}
