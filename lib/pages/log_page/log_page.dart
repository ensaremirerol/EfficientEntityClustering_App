import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/services/log_service/log_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  void didChangeDependencies() {
    InstanceController().getByType<LogService>().connect();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    InstanceController().getByType<LogService>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('log_page', style: Theme.of(context).textTheme.displaySmall).tr(),
            Divider(),
            const SizedBox(height: 20),
            Expanded(
                child: StreamBuilder(
                    stream: InstanceController().getByType<LogService>().stream,
                    builder: (context, snapshot) {
                      return Card(
                        child: SelectionArea(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.all(16.0),
                            color: Colors.grey[900],
                            child: SingleChildScrollView(
                              reverse: true,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(snapshot.data ?? '',
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: 'RobotoMono',
                                        overflow: TextOverflow.visible,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
