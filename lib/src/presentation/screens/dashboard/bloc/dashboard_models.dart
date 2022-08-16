import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_boards_macos/src/data/model/local/card_model.dart';
import 'package:todo_boards_macos/src/data/model/local/project_model.dart';

part 'dashboard_models.freezed.dart';

@freezed
class DashboardScreenEvent with _$DashboardScreenEvent {
  factory DashboardScreenEvent.getInfo() = GetInfoEvent;

  factory DashboardScreenEvent.setProject({
    required int projectIndex,
  }) = SetProjectEvent;

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

  factory DashboardScreenEvent.addCard({
    required String note,
    required int projectId,
    required int categoryId,
  }) = AddCardEvent;
}

@freezed
class DashboardScreenState with _$DashboardScreenState {
  DashboardScreenStateData get data =>
      this as DashboardScreenStateData;

  const DashboardScreenState._();

  factory DashboardScreenState.data({
    @Default(0) int projectIndex,
    @Default([]) List<ProjectModel> projects,
    @Default([]) List<CardModel> cards1,
    @Default([]) List<CardModel> cards2,
    @Default([]) List<CardModel> cards3,
  }) = DashboardScreenStateData;
}
