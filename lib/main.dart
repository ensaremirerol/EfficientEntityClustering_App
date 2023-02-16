import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/router/router_config.dart';
import 'package:eec_app/services/log_service/log_service.dart';
import 'package:eec_app/services/setup_service/setup_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  InstanceController().addInstance(LogService, LogService());
  InstanceController().addInstance(SnackBarService, SnackBarService());
  InstanceController().addInstance(SetupService, SetupService());

  runApp(ProviderScope(
    child: EasyLocalization(
      path: 'assets/langs',
      supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
      fallbackLocale: Locale('en', 'US'),
      child: App(),
    ),
  ));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scaffoldMessengerKey: InstanceController()
          .getByType<SnackBarService>()
          .scaffoldMessengerKey,
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      title: 'Eec App',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
