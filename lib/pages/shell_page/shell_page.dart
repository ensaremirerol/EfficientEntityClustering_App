import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/models/user_model/user_model.dart';
import 'package:eec_app/repositories/user_repository/user_repository.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:eec_app/widgets/responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part './widgets/shell_page_small.dart';
part './widgets/shell_page_large.dart';
part './widgets/drawer_header.dart';
part './data/navigation_item.dart';

final navigationItems = [
  const NavigationItem(
      title: 'dashboard', index: 0, icon: Icons.dashboard, route: '/dashboard'),
  const NavigationItem(
      title: 'user', index: 1, icon: Icons.person, route: '/user'),
  const NavigationItem(
      title: 'labeling', index: 2, icon: Icons.checklist, route: '/labeling'),
  const NavigationItem(
      title: 'data', index: 3, icon: Icons.data_array, route: '/data'),
  const NavigationItem(
    title: 'settings',
    index: 4,
    icon: Icons.settings,
    route: '/settings',
  ),
];

final shellPageNumberProvider = StateProvider<int>((ref) => 0);

class ShellPage extends ConsumerWidget {
  const ShellPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBuilder(
        smallScreen: _ShellPageSmall(key: const Key('small'), child: child),
        mediumScreen: _ShellPageLarge(
            key: const Key('medium'), child: child, initalIsExtended: false),
        largeScreen: _ShellPageLarge(
            key: const Key('large'), child: child, initalIsExtended: true));
  }
}
