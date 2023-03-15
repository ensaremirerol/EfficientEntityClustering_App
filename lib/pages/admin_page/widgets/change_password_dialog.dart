part of '../admin_page.dart';

class _ChangePasswordDialog extends ConsumerStatefulWidget {
  const _ChangePasswordDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __ChangePasswordDialogState();
}

class __ChangePasswordDialogState extends ConsumerState<_ChangePasswordDialog> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
        child: Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('change_username').tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              
              CustomTextField.formField(
                controller: _newPasswordController,
                hintText: 'password'.tr(),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password_required'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField.formField(
                controller: _confirmPasswordController,
                hintText: 'confirm_password'.tr(),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password_required'.tr();
                  }
                  if (value != _newPasswordController.text) {
                    return 'passwords_not_match'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('cancel',
                            style: TextStyle(color: Colors.white))
                        .tr(),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop({
                          'newPassword': _newPasswordController.text,
                        });
                      }
                    },
                    child: const Text('change_password').tr(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
