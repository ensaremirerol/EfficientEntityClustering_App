part of '../labeling_page.dart';

class _EntityCard extends StatelessWidget {
  const _EntityCard({super.key, required this.mention, required this.id});

  final String mention;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('entity_mention'.tr(),
                style: Theme.of(context).textTheme.bodyMedium),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            Text(
              mention,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            Text('entity_id_arg', style: Theme.of(context).textTheme.bodySmall)
                .tr(
              namedArgs: {
                'entity_id': id,
              }
            ),
          ],
        ),
      ),
    );
  }
}
