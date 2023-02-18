import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ClusterListTile extends StatelessWidget {
  const ClusterListTile(
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
            subtitle: const Text('cluster_id_arg').tr(
              namedArgs: {
                'cluster_id': clusterId,
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add, color: Colors.green),
              onPressed: onPressed,
            )),
      ),
    );
  }
}
