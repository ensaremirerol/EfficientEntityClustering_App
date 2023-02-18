part of '../../data_page.dart';

final entityProvider =
    StateNotifierProvider<EntityPageController, EntityPageState>(
        (ref) => EntityPageController(ref: ref));

class _EntityPage extends ConsumerStatefulWidget {
  const _EntityPage();

  @override
  _EntityPageState createState() => _EntityPageState();
}

class _EntityPageState extends ConsumerState<_EntityPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        smallScreen: _EntityPageSmall(
          onSearch: _onSearch,
          onRefresh: _onRefresh,
          onImport: _onImport,
          onAdd: _onAdd,
          onDeleteSelected: _onDeleteSelected,
          onExport: _onExport,
        ),
        mediumScreen: _EntityPageMedium(
          onSearch: _onSearch,
          onRefresh: _onRefresh,
          onImport: _onImport,
          onAdd: _onAdd,
          onDeleteSelected: _onDeleteSelected,
          onExport: _onExport,
        ),
        largeScreen: _EntityPageLarge(
          onSearch: _onSearch,
          onRefresh: _onRefresh,
          onImport: _onImport,
          onAdd: _onAdd,
          onDeleteSelected: _onDeleteSelected,
          onExport: _onExport,
        ));
  }

  void _onSearch(String? value) {
    ref.read(entityProvider.notifier).search(value);
  }

  void _onRefresh() {
    ref.read(entityProvider.notifier).fetchEntities();
  }

  void _onImport() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (result == null) return;
    final csv = await CsvService.readCsv(result.files.first);
    showDialog(
        context: context,
        builder: (context) => _ImportEntityDialog(csvModel: csv));
  }

  void _onAdd() {
    showDialog(
        context: context, builder: (context) => const _AddEntityDialog());
  }

  void _onDeleteSelected() async {
    final bool? result = await showDialog<bool>(
        context: context,
        builder: (context) => DestructiveAlert(
              title: 'delete_entity'.tr(),
              content: 'delete_entities_confirm'.tr(
                namedArgs: {
                  'count': ref
                      .read(entityProvider)
                      .selectedEntityIds
                      .length
                      .toString()
                },
              ),
              cancelText: 'cancel'.tr(),
              destructiveText: 'delete'.tr(),
            ));
    if (result ?? false) {
      ref.read(entityProvider.notifier).deleteSelected();
    }
  }

  void _onExport() async {
    await ref.read(entityProvider.notifier).exportAll();
  }
}
