part of '../../data_page.dart';

final _clusterSearchProvider =
    StateNotifierProvider<SearchClusterController, SearchClusterState>((ref) {
  return SearchClusterController();
});

class _EditClusterDialog extends ConsumerWidget {
  const _EditClusterDialog(
      {required this.entityId, required this.clusterId});
  final String entityId;
  final String clusterId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_clusterSearchProvider);
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('change_cluster').tr(),
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
              Text('change_cluster',
                      style: Theme.of(context).textTheme.displaySmall)
                  .tr(),
              const Divider(),
              CustomTextField(
                hintText: 'search_clusters'.tr(),
                onChanged: (value) {
                  ref.read(_clusterSearchProvider.notifier).search(value);
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: _ChangeClusterForm(
                      entityId: entityId, clusterId: clusterId)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangeClusterForm extends ConsumerWidget {
  const _ChangeClusterForm(
      {required this.entityId, required this.clusterId});
  final String entityId;
  final String clusterId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_clusterSearchProvider);
    return Column(
      children: [
        Expanded(
          child: state.clusters.isEmpty
              ? Center(
                  child: state.searchQuery?.isEmpty ?? true
                      ? const Text('enter_text_search').tr()
                      : const Text('no_clusters_found').tr())
              : ListView.builder(
                  itemCount: state.clusters.length,
                  itemBuilder: (context, index) {
                    final cluster = state.clusters[index];
                    return ClusterListTile(
                        clusterName: cluster.cluster_name,
                        clusterId: cluster.cluster_id,
                        onPressed: () async {
                          if (clusterId == cluster.cluster_id) {
                            InstanceController()
                                .getByType<SnackBarService>()
                                .showErrorMessage(
                                    'warning_assing_same_cluster'.tr());
                            return;
                          }
                          if (clusterId == '') {
                            ref
                                .read(_clusterSearchProvider.notifier)
                                .addToCluster(entityId, cluster.cluster_id);
                          }
                          await ref
                              .read(_clusterSearchProvider.notifier)
                              .changeCluster(
                                  entityId, clusterId, cluster.cluster_id);
                          Navigator.of(context).pop();
                        });
                  },
                ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  const Text('cancel', style: TextStyle(color: Colors.black54))
                      .tr(),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () async {
                await ref
                    .read(_clusterSearchProvider.notifier)
                    .clearCluster(entityId, clusterId);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('clear_cluster').tr(),
            ),
          ],
        ),
      ],
    );
  }
}
