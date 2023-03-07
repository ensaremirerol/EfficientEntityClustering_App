part of '../shell_page.dart';

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        InstanceController().getByType<UserRepository>().user!;
    return DrawerHeader(child: Text('menu'.tr()));
  }
}
