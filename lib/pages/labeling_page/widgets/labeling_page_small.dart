part of '../labeling_page.dart';

class _LabelingPageSmall extends ConsumerWidget {
  const _LabelingPageSmall({super.key});

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
                  ? _InitalWidget()
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      primary: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _EntityCard(
                              mention: state.currentEntityMention!,
                              id: state.currentEntityId!),
                          const SizedBox(height: 20),
                          const Icon(Icons.arrow_downward),
                          const SizedBox(height: 20),
                          _ClusterPane(
                            height: max(
                                500, MediaQuery.of(context).size.height * 0.6),
                          ),
                        ],
                      ),
                    ))
        ],
      ),
    );
  }
}
