import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/globals.dart';
import 'package:eec_app/pages/shell_page/shell_page.dart';
import 'package:eec_app/services/setup_service/setup_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locale_emoji_flutter/locale_emoji_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('settings', style: Theme.of(context).textTheme.displaySmall)
              .tr(),
          const Divider(),
          const SizedBox(height: 20),
          Expanded(
              child: ListView(
            children: [
              _SettingsTile(
                title: 'restart_app'.tr(),
                subtitle: 'restart_app_desc'.tr(),
                leading: const Icon(Icons.restart_alt),
                onTap: () async {
                  final bool? result = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('restart_app').tr(),
                        content: const Text('restart_app_confirm').tr(),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('cancel').tr()),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: const Text('yes').tr()),
                        ],
                      );
                    },
                  );
                  if (result == null || !result) return;
                  InstanceController().getByType<SetupService>().reset();
                  ref.read(shellPageNumberProvider.notifier).state = 0;
                  Phoenix.rebirth(context);
                },
              ),
              _SettingsTile(
                title: 'language'.tr(),
                subtitle: 'language_desc'.tr(),
                leading: const Icon(Icons.language),
                trailing: DropdownButton<Locale>(
                  value: context.locale,
                  items: context.supportedLocales.map((Locale locale) {
                    return DropdownMenuItem(
                      value: locale,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(locale.languageCode).tr(),
                          Text(locale.flagEmoji ?? ''),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (Locale? value) {
                    if (value == null) return;
                    context.setLocale(value);
                  },
                ),
              ),
              _SettingsTile(
                title: 'dark_mode'.tr(),
                subtitle: 'dark_mode_desc'.tr(),
                leading: themeString == 'dark'
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
                trailing: Switch(
                  value: themeString == 'dark',
                  onChanged: (value) {
                    themeString = value ? 'dark' : 'light';
                    InstanceController()
                        .getByType<SharedPreferences>()
                        .setString('brightness', themeString!);
                    ref.read(themeModeProvider.notifier).state =
                        value ? Brightness.dark : Brightness.light;
                  },
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            leading: leading,
            trailing: trailing,
            onTap: onTap),
      ),
    );
  }
}
