part of '../admin_page.dart';

class _AdminPageMedium extends ConsumerWidget {
  const _AdminPageMedium({
    required this.onSearch,
    required this.onRefresh,
    required this.onAdd,
    required this.onDeleteSelected,
  });

  final void Function(String? value) onSearch;
  final void Function() onRefresh;
  final void Function() onAdd;
  final void Function() onDeleteSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminPageController);
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
                            enabled: state.selectedUserIds.isNotEmpty,
                            onTap: onDeleteSelected,
                          ),
                          PopupMenuItem(
                            child: const Text('add').tr(),
                            onTap: onAdd,
                          ),
                        ]),
              ],
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          const _UserDataTable(),
          const Divider(indent: 16, endIndent: 16),
          const _AdminTableFoot(),
        ],
      ),
    );
  }
}
