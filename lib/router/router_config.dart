import 'package:eec_app/pages/dashboard/dashboard.dart';
import 'package:eec_app/pages/data_page/data_page.dart';
import 'package:eec_app/pages/shell_page/shell_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    initialLocation: '/dashboard',
    navigatorKey: rootNavigatorKey,
    routes: [
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
        ],
      )
    ]);
