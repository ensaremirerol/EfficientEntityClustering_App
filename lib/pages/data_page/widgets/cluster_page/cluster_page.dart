part of '../../data_page.dart';

final clusterProvider =
    StateNotifierProvider<ClusterPageController, ClusterPageState>(
        (ref) => ClusterPageController(ref: ref));

class _ClusterPage extends StatelessWidget {
  const _ClusterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        smallScreen: _ClusterPageSmall(),
        mediumScreen: _ClusterPageMedium(),
        largeScreen: _ClusterPageLarge());
  }
}
