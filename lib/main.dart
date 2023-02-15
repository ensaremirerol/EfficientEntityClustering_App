import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/repositories/cluster_repository/cluster_repository.dart';
import 'package:eec_app/repositories/entity_repository/entity_repository.dart';
import 'package:eec_app/router/router_config.dart';
import 'package:eec_app/services/API_service/api_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final api_service = APIService(BaseOptions(
    baseUrl: 'http://0.0.0.0:8000',
  ));

  InstanceController().addInstance(APIService, api_service);

  InstanceController().addInstance(EntityRepository, EntityRepository());

  InstanceController().addInstance(ClusterRepository, ClusterRepository());

  InstanceController().addInstance(SnackBarService, SnackBarService());

  await InstanceController().getByType<EntityRepository>().refresh();

  await InstanceController().getByType<ClusterRepository>().refresh();

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
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
