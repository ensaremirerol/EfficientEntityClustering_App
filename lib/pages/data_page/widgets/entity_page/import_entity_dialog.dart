part of '../../data_page.dart';

class _ImportEntityDialog extends ConsumerWidget {
  const _ImportEntityDialog({super.key, required this.csvModel});

  final CsvModel csvModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Import entity'),
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
              Text('Import from csv',
                  style: Theme.of(context).textTheme.displaySmall),
              const Divider(),
              const SizedBox(height: 20),
              Text('warning_duplicate_entity',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              _ImportEntityForm(
                csvModel: csvModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImportEntityForm extends ConsumerStatefulWidget {
  _ImportEntityForm({super.key, required this.csvModel});
  final CsvModel csvModel;
  @override
  _ImportEntityFormState createState() => _ImportEntityFormState();
}

class _ImportEntityFormState extends ConsumerState<_ImportEntityForm> {
  final _formKey = GlobalKey<FormState>();
  String? idColumn = null;
  String? mentionColumn = null;
  final TextEditingController _entitySourceController = TextEditingController();

  @override
  void dispose() {
    _entitySourceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: idColumn,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a value';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Id column', border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  idColumn = value!;
                });
              },
              items: widget.csvModel.headers
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        key: ValueKey(e),
                        child: Text(e),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: mentionColumn,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a value';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Mention column', border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  mentionColumn = value!;
                });
              },
              items: widget.csvModel.headers
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _entitySourceController,
              decoration: const InputDecoration(
                  labelText: 'Entity source', border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a value';
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
                          .addEntitiesFromCsv(widget.csvModel, idColumn!,
                              mentionColumn!, _entitySourceController.text);
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
