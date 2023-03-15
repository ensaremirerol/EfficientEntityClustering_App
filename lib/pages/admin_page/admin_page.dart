import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/controllers/admin_page/admin_page_controller.dart';
import 'package:eec_app/controllers/admin_page/admin_page_state.dart';
import 'package:eec_app/widgets/custom_text_field/custom_text_field.dart';
import 'package:eec_app/widgets/destructive_alert/destructive_alert.dart';
import 'package:eec_app/widgets/responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './widgets/admin_page_small.dart';
part './widgets/admin_page_medium.dart';
part './widgets/admin_page_large.dart';
part './widgets/admin_page_table.dart';
part './widgets/admin_table_foot.dart';
part './widgets/change_password_dialog.dart';
part './widgets/change_username_dialog.dart';
part './widgets/change_user_scopes.dart';
part './widgets/add_user_dialog.dart';

final adminPageController =
    StateNotifierProvider.autoDispose<AdminPageController, AdminPageState>((ref) {
  return AdminPageController();
});

class AdminPage extends ConsumerStatefulWidget {
  const AdminPage({super.key});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends ConsumerState<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('user', style: Theme.of(context).textTheme.displaySmall).tr(),
          const Divider(),
          const SizedBox(height: 20),
          Expanded(
            child: ResponsiveBuilder(
              smallScreen: _AdminPageSmall(
                onAdd: _onAdd,
                onDeleteSelected: _onDeleteSelected,
                onRefresh: _onRefresh,
                onSearch: _onSearch,
              ),
              mediumScreen: _AdminPageMedium(
                onAdd: _onAdd,
                onDeleteSelected: _onDeleteSelected,
                onRefresh: _onRefresh,
                onSearch: _onSearch,
              ),
              largeScreen: _AdminPageLarge(
                onAdd: _onAdd,
                onDeleteSelected: _onDeleteSelected,
                onRefresh: _onRefresh,
                onSearch: _onSearch,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onSearch(String? value) {
    ref.read(adminPageController.notifier).selectUser(value ?? '');
  }

  void _onAdd() async {
    final Map<String, Object>? result = await showDialog<Map<String, Object>>(
        context: context, builder: (context) => const _AddUserDialog());

    if (result != null) {
      final username = result['username']! as String;
      final password = result['password']! as String;
      final scopes = result['scopes']! as List<String>;
      await ref
          .read(adminPageController.notifier)
          .addUser(username, password, scopes);
    }
  }

  void _onDeleteSelected() async {
    final bool? result = await showDialog<bool>(
        context: context,
        builder: (context) => DestructiveAlert(
              title: 'delete_cluster'.tr(),
              content: 'delete_clusters_confirm'.tr(namedArgs: {
                'count': ref
                    .read(adminPageController)
                    .selectedUserIds
                    .length
                    .toString(),
              }),
              cancelText: 'cancel'.tr(),
              destructiveText: 'delete'.tr(),
            ));
    if (result ?? false) {
      ref.read(adminPageController.notifier).deleteSelectedUsers();
    }
  }

  void _onRefresh() {
    ref.read(adminPageController.notifier).refresh();
  }
}
