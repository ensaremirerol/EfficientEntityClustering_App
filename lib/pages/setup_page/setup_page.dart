import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/services/setup_service/setup_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:eec_app/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:locale_emoji_flutter/locale_emoji_flutter.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _wsUrlController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    _wsUrlController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _urlController.text = 'http://0.0.0.0:8000';
    _wsUrlController.text = 'ws://0.0.0.0:8000';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setup_page').tr(),
        actions: [
          DropdownButton<Locale>(
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
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('setup_page',
                          style: Theme.of(context).textTheme.displaySmall)
                      .tr(),
                  Divider(),
                  const SizedBox(height: 20),
                  Form(
                      key: _formKey,
                      child: Column(children: [
                        CustomTextField.formField(
                          controller: _urlController,
                          hintText: 'URL',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter_text_warning'.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField.formField(
                          controller: _wsUrlController,
                          hintText: 'WS URL',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter_text_warning'.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final bool result = await InstanceController()
                                  .getByType<SetupService>()
                                  .configure(_urlController.text,
                                      _wsUrlController.text);
                              if (result) {
                                GoRouter.of(context).go('/');
                              }
                            }
                          },
                          child: Text('submit').tr(),
                        )
                      ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
