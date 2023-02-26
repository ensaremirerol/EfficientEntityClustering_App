part of '../labeling_page.dart';

class _LabelingPageSmall extends ConsumerWidget {
  const _LabelingPageSmall();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(labelingProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('labeling_page', style: Theme.of(context).textTheme.displaySmall)
              .tr(),
          const Divider(),
          const SizedBox(height: 20),
          Expanded(
              child: state.currentEntityId == null
                  ? const _InitalWidget()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          _EntityCard(
                              mention: state.currentEntityMention!,
                              id: state.currentEntityId!),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(labelingProvider.notifier)
                                    .getNewEntity();
                              },
                              child: const Text(
                                'get_next_entity',
                              ).tr(),
                            ),
                          ),
                          const Icon(Icons.arrow_downward),
                          const SizedBox(height: 20),
                          Expanded(
                            child: _ClusterPane(
                              
                            ),
                          ),
                        ],
                      ),
                    ))
        ],
      ),
    );
  }
}
