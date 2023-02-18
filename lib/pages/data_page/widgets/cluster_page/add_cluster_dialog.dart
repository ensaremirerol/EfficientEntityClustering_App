part of '../../data_page.dart';

class _AddClusterDialog extends StatelessWidget {
  const _AddClusterDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('add_cluster').tr(),
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
              Text('add_cluster',
                      style: Theme.of(context).textTheme.displaySmall)
                  .tr(),
              const Divider(),
              const SizedBox(height: 20),
              _AddClusterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddClusterForm extends ConsumerStatefulWidget {
  _AddClusterForm();

  @override
  _AddClusterFormState createState() => _AddClusterFormState();
}

class _AddClusterFormState extends ConsumerState<_AddClusterForm> {
  final _formKey = GlobalKey<FormState>();

  final _clusterNameController = TextEditingController();

  @override
  void dispose() {
    _clusterNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField.formField(
              controller: _clusterNameController,
              hintText: 'Cluster Name',
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
                          .read(clusterProvider.notifier)
                          .addCluster(_clusterNameController.text);
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
