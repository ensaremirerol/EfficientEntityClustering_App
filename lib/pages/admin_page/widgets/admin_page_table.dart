part of '../admin_page.dart';

class _UserDataTable extends ConsumerWidget {
  const _UserDataTable();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminPageController);
    return Expanded(
        child: SingleChildScrollView(
      primary: true,
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        primary: true,
        child: state.users.isEmpty
            ? Center(
                child: const Text('no_data').tr(),
              )
            : SelectionArea(
                child: DataTable(
                    onSelectAll: (value) {
                      if (value ?? false) {
                        ref.read(adminPageController.notifier).selectAll();
                      } else {
                        ref.read(adminPageController.notifier).selectNone();
                      }
                    },
                    sortColumnIndex: state.selectedColumnIndex,
                    sortAscending: state.isAscending ?? true,
                    columns: [
                      DataColumn(
                        label: const Text('user_id').tr(),
                      ),
                      DataColumn(
                          label: const Text('username').tr(),
                          onSort: (columnIndex, ascending) {
                            if (ascending) {
                              ref.read(adminPageController.notifier).sortBy(
                                  ascending,
                                  columnIndex,
                                  (e1, e2) =>
                                      e2.username.compareTo(e1.username));
                            } else {
                              ref.read(adminPageController.notifier).sortBy(
                                  ascending,
                                  columnIndex,
                                  (e1, e2) =>
                                      e1.username.compareTo(e2.username));
                            }
                          }),
                      DataColumn(
                        label: const Text('scopes').tr(),
                      ),
                      DataColumn(
                        label: const Text('change_password').tr(),
                      ),
                      DataColumn(label: const Text('delete').tr()),
                    ],
                    rows: state.users
                        .skip(state.tablePage * state.tableRowsPerPage)
                        .take(state.tableRowsPerPage)
                        .map((e) => DataRow(
                                selected:
                                    state.selectedUserIds.contains(e.user_id),
                                onSelectChanged: (value) {
                                  ref
                                      .read(adminPageController.notifier)
                                      .selectUser(e.user_id);
                                },
                                cells: [
                                  DataCell(Text(e.user_id)),
                                  DataCell(Text(e.username)),
                                  DataCell(
                                    Text(e.scopes.join(', ')),
                                    onTap: () async {
                                      final List<String>? result =
                                          await showDialog(
                                        context: context,
                                        builder: (context) =>
                                            _ChangeUserScopes(scopes: e.scopes),
                                      );
                                      if (result != null) {
                                        ref
                                            .read(adminPageController.notifier)
                                            .changeScopes(e.user_id, result);
                                      }
                                    },
                                  ),
                                  DataCell(
                                    const Icon(Icons.edit),
                                    onTap: () async {
                                      final Map<String, String>? result =
                                          await showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const _ChangePasswordDialog(),
                                      );

                                      if (result != null) {
                                        ref
                                            .read(adminPageController.notifier)
                                            .changePassword(
                                                e.user_id, result['password']!);
                                      }
                                    },
                                  ),
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
                                                      title: 'delete_user'.tr(),
                                                      content:
                                                          'delete_user_content'
                                                              .tr(),
                                                      cancelText: 'cancel'.tr(),
                                                      destructiveText:
                                                          'delete'.tr(),
                                                    ));
                                        if (result ?? false) {
                                          ref
                                              .read(
                                                  adminPageController.notifier)
                                              .deleteUser(e.user_id);
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
