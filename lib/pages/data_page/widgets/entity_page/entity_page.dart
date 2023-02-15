part of '../../data_page.dart';

final entityProvider =
    StateNotifierProvider<EntityPageController, EntityPageState>(
        (ref) => EntityPageController(ref: ref));

class _EntityPage extends StatelessWidget {
  const _EntityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        smallScreen: _EntityPageSmall(),
        mediumScreen: _EntityPageMedium(),
        largeScreen: _EntityPageLarge());
  }
}
