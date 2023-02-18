
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';


@freezed
class DashboardState with _$DashboardState {
  factory DashboardState(
    {
      required int totalEnities,
      required int totalLabledEnities,
      required int totalClusters,
    }
  ) = _DashboardState;
	
}
