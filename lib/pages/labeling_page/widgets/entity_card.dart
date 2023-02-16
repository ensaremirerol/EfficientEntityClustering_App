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
            Text('Entity Mention',
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
            Text('Entity ID : $id',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
