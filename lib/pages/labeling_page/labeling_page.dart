import 'package:eec_app/controllers/labeling_page/labeling_page_controller.dart';
import 'package:eec_app/controllers/labeling_page/labeling_page_state.dart';
import 'package:eec_app/widgets/custom_text_field/custom_text_field.dart';
import 'package:eec_app/widgets/responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './widgets/inital_widget.dart';
part './widgets/cluster_pane.dart';
part './widgets/cluster_list_tile.dart';
part './widgets/entity_card.dart';
part './widgets/labeling_page_small.dart';
part './widgets/labeling_page_large.dart';

final labelingProvider =
    StateNotifierProvider<LabelingPageController, LabelingPageState>((ref) {
  return LabelingPageController(ref);
});

class LabelingPage extends ConsumerStatefulWidget {
  const LabelingPage({super.key});

  @override
  _LabelingPageState createState() => _LabelingPageState();
}

class _LabelingPageState extends ConsumerState<LabelingPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(labelingProvider);
    return ResponsiveBuilder(
        key: Key(state.currentEntityId ?? 'labeling_page'),
        smallScreen: _LabelingPageSmall(),
        largeScreen: _LabelingPageLarge());
  }
}
