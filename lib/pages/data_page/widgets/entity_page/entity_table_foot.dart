part of '../../data_page.dart';

class _EntityTableFoot extends ConsumerWidget {
  const _EntityTableFoot({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(entityProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicHeight(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: state.tablePage == 0
                        ? null
                        : () {
                            ref.read(entityProvider.notifier).setPage(0);
                          },
                    icon: const Icon(Icons.first_page)),
                IconButton(
                    onPressed: state.tablePage == 0
                        ? null
                        : () {
                            ref
                                .read(entityProvider.notifier)
                                .setPage(state.tablePage - 1);
                          },
                    icon: const Icon(Icons.chevron_left)),
                Text('Page: ${state.tablePage + 1}'),
                IconButton(
                    onPressed: state.tablePage ==
                            state.entityList.length ~/ state.tableRowsPerPage
                        ? null
                        : () {
                            ref
                                .read(entityProvider.notifier)
                                .setPage(state.tablePage + 1);
                          },
                    icon: const Icon(Icons.chevron_right)),
                IconButton(
                    onPressed: state.tablePage ==
                            state.entityList.length ~/ state.tableRowsPerPage
                        ? null
                        : () {
                            ref.read(entityProvider.notifier).setPage(
                                state.entityList.length ~/
                                    state.tableRowsPerPage);
                          },
                    icon: const Icon(Icons.last_page)),
                const VerticalDivider(
                  width: 16,
                ),
                Text('Total: ${state.entityList.length}'),
                const VerticalDivider(
                  width: 16,
                ),
                Text('Selected: ${state.selectedEntityIds.length}'),
                const VerticalDivider(
                  width: 16,
                ),
                Text('Page size: '),
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
                        ref.read(entityProvider.notifier).setPageSize(value!)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
