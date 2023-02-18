part of '../labeling_page.dart';

class _InitalWidget extends ConsumerWidget {
  const _InitalWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('start_labeling').tr(),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                ref.read(labelingProvider.notifier).getNewEntity();
              },
              child: const Text('get_next_entity').tr()),
        ],
      ),
    );
  }
}
