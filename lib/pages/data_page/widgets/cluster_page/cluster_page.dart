part of '../../data_page.dart';

final clusterProvider =
    StateNotifierProvider<ClusterPageController, ClusterPageState>(
        (ref) => ClusterPageController(ref: ref));

class _ClusterPage extends ConsumerStatefulWidget {
  const _ClusterPage();

  @override
  _ClusterPageState createState() => _ClusterPageState();
}

class _ClusterPageState extends ConsumerState<_ClusterPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        smallScreen: _ClusterPageSmall(
            onSearch: _onSearch,
            onRefresh: _onRefresh,
            onImport: _onImport,
            onAdd: _onAdd,
            onExport: _onExport,
            onDeleteSelected: _onDeleteSelected),
        mediumScreen: _ClusterPageMedium(
            onSearch: _onSearch,
            onRefresh: _onRefresh,
            onImport: _onImport,
            onAdd: _onAdd,
            onExport: _onExport,
            onDeleteSelected: _onDeleteSelected),
        largeScreen: _ClusterPageLarge(
            onSearch: _onSearch,
            onRefresh: _onRefresh,
            onImport: _onImport,
            onAdd: _onAdd,
            onExport: _onExport,
            onDeleteSelected: _onDeleteSelected));
  }

  void _onSearch(String? value) {
    ref.read(clusterProvider.notifier).search(value);
  }

  void _onRefresh() {
    ref.read(clusterProvider.notifier).fetchClusters();
  }

  void _onImport() async {}

  void _onExport() async {
    await ref.read(clusterProvider.notifier).exportAll();
  }

  void _onAdd() async {
    showDialog(
        context: context, builder: (context) => const _AddClusterDialog());
  }

  void _onDeleteSelected() async {
    final bool? result = await showDialog<bool>(
        context: context,
        builder: (context) => DestructiveAlert(
              title: 'delete_cluster'.tr(),
              content: 'delete_clusters_confirm'.tr(namedArgs: {
                'count': ref
                    .watch(clusterProvider)
                    .selectedClusterIds
                    .length
                    .toString(),
              }),
              cancelText: 'cancel'.tr(),
              destructiveText: 'delete'.tr(),
            ));
    if (result ?? false) {
      ref.read(clusterProvider.notifier).deleteSelected();
    }
  }
}
