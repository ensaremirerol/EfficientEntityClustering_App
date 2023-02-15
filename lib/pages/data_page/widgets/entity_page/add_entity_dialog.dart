part of '../../data_page.dart';

class _AddEntityDialog extends StatelessWidget {
  const _AddEntityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add entity'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Add entity',
                  style: Theme.of(context).textTheme.displaySmall),
              const Divider(),
              const SizedBox(height: 20),
              _AddEntityForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddEntityForm extends ConsumerStatefulWidget {
  _AddEntityForm({super.key});

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
              hintText: 'Entity mention',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField.formField(
              controller: _entitySourceController,
              hintText: 'Entity Source',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField.formField(
              controller: _entitySourceIdController,
              hintText: 'Entity Source ID',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
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
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.black54)),
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
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ));
  }
}
