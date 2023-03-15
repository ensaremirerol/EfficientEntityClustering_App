import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/controllers/user_page/user_page_controller.dart';
import 'package:eec_app/controllers/user_page/user_page_state.dart';
import 'package:eec_app/utils/restart_app.dart';
import 'package:eec_app/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part './widgets/user_tile.dart';
part './widgets/change_username_dialog.dart';
part './widgets/change_password_dialog.dart';

final userController =
    StateNotifierProvider.autoDispose<UserPageController, UserPageState>((ref) {
  return UserPageController(ref);
});

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userController);
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
            child: ListView(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Text(
                        state.user.username.substring(0, 1),
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(state.user.username,
                        style: Theme.of(context).textTheme.displayMedium),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Text('scopes', style: Theme.of(context).textTheme.displaySmall)
                    .tr(),
                const SizedBox(height: 20),
                Wrap(
                  children: state.user.scopes
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Text('user_actions',
                        style: Theme.of(context).textTheme.displaySmall)
                    .tr(),
                const SizedBox(height: 20),
                _UserListTile(
                    title: 'change_username'.tr(),
                    subtitle: 'change_username_desc'.tr(),
                    leading: const Icon(Icons.edit),
                    onTap: () async {
                      final Map<String, String>? result = await showDialog(
                        context: context,
                        builder: (context) {
                          return const _ChangeUsernameDialog();
                        },
                      );
                      if (result != null) {
                        ref.read(userController.notifier).changeUsername(
                            result['username']!, result['password']!,
                            userId: null);
                      }
                    }),
                _UserListTile(
                    title: 'change_password'.tr(),
                    subtitle: 'change_password_desc'.tr(),
                    leading: const Icon(Icons.edit),
                    onTap: () async {
                      final Map<String, String>? result = await showDialog(
                        context: context,
                        builder: (context) {
                          return const _ChangePasswordDialog();
                        },
                      );
                      if (result != null) {
                        ref.read(userController.notifier).changePassword(
                              result['oldPassword']!,
                              result['newPassword']!,
                            );
                      }
                    }),
                if (state.user.scopes.contains('admin'))
                  _adminTile(context, ref),
                _UserListTile(
                    title: 'logout'.tr(),
                    subtitle: 'logout_desc'.tr(),
                    leading: const Icon(Icons.logout),
                    onTap: () {
                      restartApp(context, ref);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _adminTile(BuildContext context, WidgetRef ref) {
    return _UserListTile(
        title: 'admin_panel'.tr(),
        subtitle: 'admin_panel_desc'.tr(),
        leading: const Icon(Icons.admin_panel_settings),
        onTap: () {
          context.goNamed('admin_panel');
        });
  }
}
