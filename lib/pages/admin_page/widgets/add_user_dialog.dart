part of '../admin_page.dart';

class _AddUserDialog extends ConsumerStatefulWidget {
  const _AddUserDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __AddUserDialogState();
}

class __AddUserDialogState extends ConsumerState<_AddUserDialog> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final scopes = <String>[]; // admin, editor, export
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
                controller: _usernameController,
                hintText: 'username'.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'username_required'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField.formField(
                controller: _passwordController,
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
              const Text('scopes').tr(),
              for (final scope in ['admin', 'editor', 'export'])
                CheckboxListTile(
                  title: Text(scope).tr(),
                  value: scopes.contains(scope),
                  onChanged: (value) {
                    if (value == true) {
                      scopes.add(scope);
                    } else {
                      scopes.remove(scope);
                    }
                    setState(() {});
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
                          'username': _usernameController.text,
                          'password': _passwordController.text,
                          'scopes': scopes,
                        });
                      }
                    },
                    child: const Text('add').tr(),
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
