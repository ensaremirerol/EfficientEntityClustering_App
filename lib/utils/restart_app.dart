import 'package:eec_app/pages/shell_page/shell_page.dart';
import 'package:eec_app/services/setup_service/setup_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void restartApp(BuildContext context, WidgetRef ref) {
  InstanceController().getByType<SetupService>().reset();
  ref.read(shellPageNumberProvider.notifier).state = 0;
  Phoenix.rebirth(context);
}
