import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_boards_macos/src/data/model/local/card_model.dart';
import 'package:todo_boards_macos/src/data/model/local/project_model.dart';

part 'dashboard_models.freezed.dart';

// enum DashboardStatus { idle, completed }

@freezed
class DashboardScreenEvent with _$DashboardScreenEvent {
  factory DashboardScreenEvent.getInfo() = GetInfoEvent;

  factory DashboardScreenEvent.addProject({
    required String name,
  }) = AddProjectEvent;

  factory DashboardScreenEvent.changeProjectName({
    required int index,
    required String name,
  }) = ChangeProjectNameEvent;

  factory DashboardScreenEvent.delProject({
    required int index,
  }) = DelProjectEvent;

}

@freezed
class DashboardScreenState with _$DashboardScreenState {
  DashboardScreenStateData get data =>
      this as DashboardScreenStateData;

  const DashboardScreenState._();

  factory DashboardScreenState.data({
    @Default([]) List<ProjectModel> projects,
    @Default([]) List<CardModel> cards,
    // @Default(DashboardStatus.idle) DashboardStatus status,
    // @Default(false) bool isLoading,
  }) = DashboardScreenStateData;
}
