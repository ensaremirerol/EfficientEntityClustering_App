part of '../admin_page.dart';

class _AdminTableFoot extends ConsumerWidget {
  const _AdminTableFoot();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminPageController);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(
                    onPressed: state.tablePage == 0
                        ? null
                        : () {
                            ref.read(adminPageController.notifier).setPage(0);
                          },
                    icon: const Icon(Icons.first_page)),
                IconButton(
                    onPressed: state.tablePage == 0
                        ? null
                        : () {
                            ref
                                .read(adminPageController.notifier)
                                .setPage(state.tablePage - 1);
                          },
                    icon: const Icon(Icons.chevron_left)),
                const Text('page').tr(namedArgs: {
                  'page': (state.tablePage + 1).toString(),
                  'total_pages':
                      (state.users.length ~/ state.tableRowsPerPage + 1)
                          .toString(),
                }),
                IconButton(
                    onPressed: state.tablePage ==
                            state.users.length ~/ state.tableRowsPerPage
                        ? null
                        : () {
                            ref
                                .read(adminPageController.notifier)
                                .setPage(state.tablePage + 1);
                          },
                    icon: const Icon(Icons.chevron_right)),
                IconButton(
                    onPressed: state.tablePage ==
                            state.users.length ~/ state.tableRowsPerPage
                        ? null
                        : () {
                            ref.read(adminPageController.notifier).setPage(
                                state.users.length ~/
                                    state.tableRowsPerPage);
                          },
                    icon: const Icon(Icons.last_page)),
                const VerticalDivider(
                  width: 16,
                ),
                const Text('total_count').tr(
                  namedArgs: {
                    'total_count': state.users.length.toString(),
                  },
                ),
                const VerticalDivider(
                  width: 16,
                ),
                const Text('selected_count').tr(
                  namedArgs: {
                    'selected_count':
                        state.selectedUserIds.length.toString(),
                  },
                ),
                const VerticalDivider(
                  width: 16,
                ),
                const Text('page_size').tr(),
                const SizedBox(
                  width: 8,
                ),
                DropdownButton<int>(
                    value: state.tableRowsPerPage,
                    items: [10, 50, 100]
                        .map((e) => DropdownMenuItem<int>(
                            value: e, child: Text(e.toString())))
                        .toList(),
                    onChanged: (value) =>
                        ref.read(adminPageController.notifier).setPageSize(value!)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
