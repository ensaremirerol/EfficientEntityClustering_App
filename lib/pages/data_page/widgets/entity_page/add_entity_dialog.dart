part of '../../data_page.dart';

class _AddEntityDialog extends StatelessWidget {
  const _AddEntityDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('add_entity').tr(),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('add_entity',
                      style: Theme.of(context).textTheme.displaySmall)
                  .tr(),
              const Divider(),
              const SizedBox(height: 20),
              const _AddEntityForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddEntityForm extends ConsumerStatefulWidget {
  const _AddEntityForm();

  @override
  _AddEntityFormState createState() => _AddEntityFormState();
}

class _AddEntityFormState extends ConsumerState<_AddEntityForm> {
  final _formKey = GlobalKey<FormState>();

  final _entityMentionController = TextEditingController();
  final _entitySourceController = TextEditingController();
  final _entitySourceIdController = TextEditingController();

  @override
  void dispose() {
    _entityMentionController.dispose();
    _entitySourceController.dispose();
    _entitySourceIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField.formField(
              controller: _entityMentionController,
              hintText: 'entity_mention'.tr(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter_text_warning'.tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField.formField(
              controller: _entitySourceController,
              hintText: 'entity_source'.tr(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter_text_warning'.tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField.formField(
              controller: _entitySourceIdController,
              hintText: 'entity_source_id'.tr(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter_text_warning'.tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('cancel',
                          style: TextStyle(color: Colors.black54))
                      .tr(),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final bool result = await ref
                          .read(entityProvider.notifier)
                          .addEntity(
                              _entityMentionController.text,
                              _entitySourceController.text,
                              _entitySourceIdController.text);
                      if (result) Navigator.of(context).pop();
                    }
                  },
                  child: const Text('add').tr(),
                ),
              ],
            ),
          ],
        ));
  }
}
