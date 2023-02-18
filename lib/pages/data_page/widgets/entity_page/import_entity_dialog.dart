part of '../../data_page.dart';

class _ImportEntityDialog extends ConsumerWidget {
  const _ImportEntityDialog({required this.csvModel});

  final CsvModel csvModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('import_entities').tr(),
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
              Text('import_from_csv',
                      style: Theme.of(context).textTheme.displaySmall)
                  .tr(),
              const Divider(),
              const SizedBox(height: 20),
              Text('warning_duplicate_entity',
                      style: Theme.of(context).textTheme.titleLarge)
                  .tr(),
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
  const _ImportEntityForm({required this.csvModel});
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
                  return 'enter_text_warning'.tr();
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'id_column'.tr(), border: const OutlineInputBorder()),
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
                  return 'enter_text_warning'.tr();
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'mention_column'.tr(),
                  border: const OutlineInputBorder()),
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
              decoration: InputDecoration(
                  labelText: 'entity_source'.tr(),
                  border: const OutlineInputBorder()),
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
                          .addEntitiesFromCsv(widget.csvModel, idColumn!,
                              mentionColumn!, _entitySourceController.text);
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
