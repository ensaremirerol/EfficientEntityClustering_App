import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/globals.dart';
import 'package:eec_app/router/router_config.dart';
import 'package:eec_app/services/log_service/log_service.dart';
import 'package:eec_app/services/setup_service/setup_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  InstanceController().addInstance(LogService, LogService());
  InstanceController().addInstance(SnackBarService, SnackBarService());
  InstanceController().addInstance(SetupService, SetupService());
  InstanceController()
      .addInstance(SharedPreferences, await SharedPreferences.getInstance());

  themeString = InstanceController()
      .getByType<SharedPreferences>()
      .getString('brightness');

  runApp(ProviderScope(
    child: Phoenix(
      child: EasyLocalization(
        path: 'assets/langs',
        supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
        fallbackLocale: const Locale('en', 'US'),
        useFallbackTranslations: true,
        child: const App(),
      ),
    ),
  ));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeBrightness = ref.watch(themeModeProvider);
    return MaterialApp.router(
      scaffoldMessengerKey: InstanceController()
          .getByType<SnackBarService>()
          .scaffoldMessengerKey,
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Eec App',
      theme: ThemeData(
        useMaterial3: true,
        brightness: themeBrightness,
      ),
    );
  }
}
