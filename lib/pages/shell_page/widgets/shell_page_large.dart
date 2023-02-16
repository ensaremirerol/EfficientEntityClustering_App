part of '../shell_page.dart';

class _ShellPageLarge extends ConsumerStatefulWidget {
  const _ShellPageLarge(
      {super.key, required this.child, required this.initalIsExtended});

  final Widget child;
  final bool initalIsExtended;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __ShellPageLargeState();
}

class __ShellPageLargeState extends ConsumerState<_ShellPageLarge> {
  bool _isExtended = false;

  @override
  void didChangeDependencies() {
    _isExtended = widget.initalIsExtended;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavigationRail(
              elevation: 4,
              extended: _isExtended,
              minExtendedWidth: 250,
              minWidth: 75,
              leading: _MenuButton(
                key: widget.key,
                onPressed: () {
                  setState(() {
                    _isExtended = !_isExtended;
                  });
                },
              ),
              destinations: navigationItems
                  .map((item) => NavigationRailDestination(
                      icon: Icon(item.icon), label: Text(item.title)))
                  .toList(),
              selectedIndex: ref.watch(shellPageNumberProvider),
              onDestinationSelected: (index) {
                ref.read(shellPageNumberProvider.notifier).state = index;
                context.go(navigationItems[index].route);
              }),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends ConsumerWidget {
  const _MenuButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Animation animation = NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(right: lerpDouble(0, 175, animation.value)!),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: onPressed,
          ),
        );
      },
    );
  }
}
