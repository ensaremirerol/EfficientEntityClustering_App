import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/controllers/data_page/cluster_page/cluster_page_controller.dart';
import 'package:eec_app/controllers/data_page/cluster_page/cluster_page_state.dart';
import 'package:eec_app/controllers/data_page/entity_page/entity_page_controller.dart';
import 'package:eec_app/controllers/data_page/entity_page/entity_page_state.dart';
import 'package:eec_app/controllers/search_cluster/search_cluster_controller.dart';
import 'package:eec_app/controllers/search_cluster/search_cluster_state.dart';
import 'package:eec_app/services/csv_service/csv_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:eec_app/widgets/custom_text_field/custom_text_field.dart';
import 'package:eec_app/widgets/destructive_alert/destructive_alert.dart';
import 'package:eec_app/widgets/list_tiles/cluster_list_tile.dart';
import 'package:eec_app/widgets/responsive_builder/responsive_builder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'widgets/entity_page/entity_page.dart';
part 'widgets/entity_page/entity_page_large.dart';
part 'widgets/entity_page/entity_page_medium.dart';
part 'widgets/entity_page/entity_page_small.dart';
part 'widgets/entity_page/entity_table.dart';
part 'widgets/entity_page/entity_table_foot.dart';
part 'widgets/entity_page/add_entity_dialog.dart';
part 'widgets/entity_page/edit_cluster_dialog.dart';
part 'widgets/entity_page/import_entity_dialog.dart';

part 'widgets/cluster_page/cluster_page.dart';
part 'widgets/cluster_page/cluster_page_large.dart';
part 'widgets/cluster_page/cluster_page_medium.dart';
part 'widgets/cluster_page/cluster_page_small.dart';
part 'widgets/cluster_page/add_cluster_dialog.dart';
part 'widgets/cluster_page/cluster_table.dart';
part 'widgets/cluster_page/cluster_table_foot.dart';

class DataPage extends ConsumerStatefulWidget {
  const DataPage({super.key});

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends ConsumerState<DataPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('data_tables', style: Theme.of(context).textTheme.displaySmall).tr(),
          const Divider(),
          const SizedBox(height: 20),
          TabBar(controller: _tabController, tabs: [
            Tab(text: 'entity'.tr()),
            Tab(text: 'cluster'.tr()),
            //Tab(text: 'Cluster'),
          ]),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                _EntityPage(),
                _ClusterPage()
                // _ClusterPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
