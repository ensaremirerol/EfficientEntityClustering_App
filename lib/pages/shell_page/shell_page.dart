import 'dart:ui';

import 'package:eec_app/widgets/responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part './widgets/shell_page_small.dart';
part './widgets/shell_page_large.dart';
part './data/navigation_item.dart';

const navigationItems = [
  NavigationItem(
      title: 'Dashboard', index: 0, icon: Icons.dashboard, route: '/dashboard'),
  NavigationItem(
      title: 'Labeling', index: 1, icon: Icons.checklist, route: '/labeling'),
  NavigationItem(
      title: 'Data', index: 2, icon: Icons.data_array, route: '/data'),
  NavigationItem(
    title: 'Logs',
    index: 3,
    icon: Icons.list,
    route: '/logs',
  ),
  NavigationItem(
    title: 'Settings',
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
        smallScreen: _ShellPageSmall(key: Key('small'), child: child),
        mediumScreen: _ShellPageLarge(
            key: Key('medium'), child: child, initalIsExtended: false),
        largeScreen: _ShellPageLarge(
            key: Key('large'), child: child, initalIsExtended: true));
  }
}
