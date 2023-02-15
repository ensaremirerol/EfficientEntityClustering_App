import 'package:eec_app/pages/dashboard/dashboard.dart';
import 'package:eec_app/pages/data_page/data_page.dart';
import 'package:eec_app/pages/log_page/log_page.dart';
import 'package:eec_app/pages/setup_page/setup_page.dart';
import 'package:eec_app/pages/shell_page/shell_page.dart';
import 'package:eec_app/services/setup_service/setup_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    initialLocation: '/dashboard',
    redirect: (context, state) {
      return InstanceController().getByType<SetupService>().isConfigured
          ? null
          : '/setup';
    },
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
          path: '/setup',
          builder: (context, state) {
            return const SetupPage();
          }),
      GoRoute(path: '/', redirect: (context, state) => '/dashboard'),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return ShellPage(
            child: child,
          );
        },
        routes: [
          GoRoute(
              path: '/dashboard',
              name: 'dashboard',
              builder: (context, state) {
                return Dashboard();
              }),
          GoRoute(
              path: '/data',
              name: 'data',
              builder: (context, state) {
                return const DataPage();
              }),
          GoRoute(
              path: '/logs',
              name: 'logs',
              builder: (context, state) {
                return const LogPage();
              }),
        ],
      )
    ]);
