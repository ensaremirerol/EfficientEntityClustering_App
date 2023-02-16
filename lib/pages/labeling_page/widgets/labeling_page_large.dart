part of '../labeling_page.dart';

class _LabelingPageLarge extends ConsumerWidget {
  const _LabelingPageLarge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(labelingProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('Labeling Page',
              style: Theme.of(context).textTheme.displaySmall),
          const Divider(),
          const SizedBox(height: 20),
          Expanded(
              child: state.currentEntityId == null
                  ? _InitalWidget()
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 500,
                          child: IntrinsicHeight(
                            child: _EntityCard(
                                mention: state.currentEntityMention!,
                                id: state.currentEntityId!),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.arrow_right_alt),
                        const SizedBox(width: 20),
                        Expanded(child:
                            LayoutBuilder(builder: (context, constraints) {
                          return _ClusterPane(
                            height: constraints.maxHeight * 0.75,
                          );
                        })),
                      ],
                    ))
        ],
      ),
    );
  }
}
