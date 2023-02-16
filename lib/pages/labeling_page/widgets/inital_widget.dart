part of '../labeling_page.dart';

class _InitalWidget extends ConsumerWidget {
  const _InitalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Start labeling by pressing the button below'),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                ref.read(labelingProvider.notifier).getNewEntity();
              },
              child: const Text('Get new entity'))
        ],
      ),
    );
  }
}
