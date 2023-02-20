part of '../labeling_page.dart';

class _ClusterPane extends ConsumerStatefulWidget {
  const _ClusterPane({required this.height});

  final double height;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __ClusterPaneState();
}

class __ClusterPaneState extends ConsumerState<_ClusterPane>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(labelingProvider);

    ref.listen<String?>(
      labelingProvider.select((value) => value.searchQuery),
      (previous, next) {
        _searchController.text = next ?? '';
      },
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'possible_clusters'.tr(),
                ),
                Tab(
                  text: 'search_create_cluster'.tr(),
                ),
              ],
            ),
            SizedBox(
              height: widget.height,
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: state.possibleClusterIds?.isEmpty ?? true
                        ? Center(
                            child: const Text('no_possible_clusters').tr(),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(8),
                            primary: false,
                            itemCount: state.possibleClusterIds!.length,
                            itemBuilder: (context, index) {
                              return ClusterListTile(
                                  clusterName:
                                      state.possibleClusterNames![index],
                                  clusterId: state.possibleClusterIds![index],
                                  onPressed: () {
                                    _onAddToClusterPressed(
                                        state.possibleClusterIds![index]);
                                  });
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                            children: state.currentEntityMention!
                                .split(' ')
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          final String newText;
                                          if (state.searchQuery?.isEmpty ??
                                              true) {
                                            newText = e;
                                          } else {
                                            newText = '${state.searchQuery} $e';
                                          }
                                          ref
                                              .read(labelingProvider.notifier)
                                              .searchClusters(newText);
                                        },
                                        child: Chip(
                                          label: Text(e),
                                        ),
                                      ),
                                    ))
                                .toList()),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'search_clusters'.tr(),
                                controller: _searchController,
                                onChanged: (value) {
                                  ref
                                      .read(labelingProvider.notifier)
                                      .searchClusters(value);
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(labelingProvider.notifier)
                                      .createCluster(state.searchQuery!);
                                },
                                child: const Text('create_cluster').tr()),
                          ],
                        ),
                        Expanded(
                          child: state.clusterSearchResults.isEmpty
                              ? Center(
                                  child: const Text('no_clusters_found').tr(),
                                )
                              : ListView(
                                  padding: const EdgeInsets.all(8),
                                  primary: false,
                                  children: state.clusterSearchResults
                                      .map((e) => ClusterListTile(
                                          clusterName: e.cluster_name,
                                          clusterId: e.cluster_id,
                                          onPressed: () {
                                            _onAddToClusterPressed(
                                                e.cluster_id);
                                          }))
                                      .toList()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onAddToClusterPressed(String clusterId) async {
    ref.read(labelingProvider.notifier).addToCluster(clusterId);
  }
}
