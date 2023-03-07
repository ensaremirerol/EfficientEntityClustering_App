import 'package:eec_app/pages/dashboard/dashboard.dart';
import 'package:eec_app/pages/data_page/data_page.dart';
import 'package:eec_app/pages/labeling_page/labeling_page.dart';
import 'package:eec_app/pages/log_page/log_page.dart';
import 'package:eec_app/pages/settings_page/settings_page.dart';
import 'package:eec_app/pages/setup_page/setup_page.dart';
import 'package:eec_app/pages/shell_page/shell_page.dart';
import 'package:eec_app/pages/user_page/user_page.dart';
import 'package:eec_app/services/setup_service/setup_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

NoTransitionPage<dynamic> _noTransitionBuilder(
    GoRouterState state, Widget child) {
  return NoTransitionPage(
    key: state.pageKey,
    child: child,
  );
}

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
              pageBuilder: (context, state) =>
                  _noTransitionBuilder(state, const Dashboard())),
          GoRoute(
              path: '/user',
              name: 'user',
              routes: [
                GoRoute(
                    path: 'admin',
                    name: 'admin_panel',
                    pageBuilder: (context, state) {
                      return _noTransitionBuilder(
                          state,
                          Scaffold(
                              appBar: AppBar(
                                title: const Text('Admin Panel'),
                              ),
                              body: const Text('admin_panel')));
                    }),
              ],
              pageBuilder: (context, state) {
                return _noTransitionBuilder(state, const UserPage());
              }),
          GoRoute(
              path: '/labeling',
              name: 'labeling',
              pageBuilder: (context, state) =>
                  _noTransitionBuilder(state, const LabelingPage())),
          GoRoute(
              path: '/data',
              name: 'data',
              pageBuilder: (context, state) =>
                  _noTransitionBuilder(state, const DataPage())),
          GoRoute(
              path: '/logs',
              name: 'logs',
              pageBuilder: (context, state) =>
                  _noTransitionBuilder(state, const LogPage())),
          GoRoute(
              path: '/settings',
              name: 'settings',
              pageBuilder: (context, state) =>
                  _noTransitionBuilder(state, const SettingsPage())),
        ],
      )
    ]);
