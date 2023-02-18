part of '../dashboard.dart';

class _DashboardSmall extends ConsumerWidget {
  const _DashboardSmall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('dashboard', style: Theme.of(context).textTheme.displaySmall)
              .tr(),
          const Divider(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
