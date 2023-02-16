part of '../labeling_page.dart';

class _ClusterListTile extends StatelessWidget {
  const _ClusterListTile(
      {super.key,
      required this.clusterName,
      required this.clusterId,
      required this.onPressed});

  final String clusterName;
  final String clusterId;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            title: Text('$clusterName'),
            subtitle: Text('Cluster ID: $clusterId'),
            trailing: IconButton(
              icon: const Icon(Icons.add, color: Colors.green),
              onPressed: onPressed,
            )),
      ),
    );
  }
}
