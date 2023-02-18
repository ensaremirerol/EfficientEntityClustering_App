part of '../dashboard.dart';

class _DashboardSmall extends ConsumerWidget {
  const _DashboardSmall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Text('dashboard', style: Theme.of(context).textTheme.displaySmall)
                  .tr(),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () =>
                    ref.read(dashboardProvider.notifier).refreshValues(),
              )
            ],
          ),
          const Divider(),
          const SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            child: Wrap(
              children: [
                _DashboardCard(
                    child: Column(
                  children: [
                    Text('labeled_entities',
                            style: Theme.of(context).textTheme.displaySmall)
                        .tr(),
                    const SizedBox(height: 20),
                    SimpleCircularProgressBar(
                      progressColors: [Theme.of(context).primaryColor],
                      valueNotifier: _getPercentValueNotifier(
                          state.totalEnities, state.totalLabledEnities),
                      onGetText: (value) => const Text(
                        'percent_symbol',
                        textAlign: TextAlign.center,
                      ).tr(namedArgs: {
                        'percent': (value).toStringAsFixed(0),
                      }),
                    ),
                    const SizedBox(height: 20),
                    Text('count_total',
                            style: Theme.of(context).textTheme.displaySmall)
                        .tr(namedArgs: {
                      'count': state.totalLabledEnities.toString(),
                      'total': state.totalEnities.toString(),
                    }),
                  ],
                ))
              ],
            ),
          )),
        ],
      ),
    );
  }

  ValueNotifier<double> _getPercentValueNotifier(
      int total, int totalLabledEnities) {
    if (totalLabledEnities == 0 || total == 0) return ValueNotifier(0);
    return ValueNotifier((totalLabledEnities / total * 100).clamp(0, 100));
  }
}

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
