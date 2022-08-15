import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_boards_macos/src/data/repository/card_repository.dart';
import 'package:todo_boards_macos/src/data/repository/projects_repository.dart';
import 'dashboard_models.dart';

class DashboardBloc
    extends Bloc<DashboardScreenEvent, DashboardScreenState> {
  final _projectsRepository = GetIt.instance<ProjectsRepository>();
  final _cardRepository = GetIt.instance<CardRepository>();

  DashboardBloc() : super(DashboardScreenState.data()) {
    on<GetInfoEvent>(
          (event, emit) => _onGetInfo(event, emit),
    );
    on<AddProjectEvent>(
          (event, emit) => _onAddProject(event, emit),
    );
    on<DelProjectEvent>(
          (event, emit) => _onDelProject(event, emit),
    );
    on<ChangeProjectNameEvent>(
          (event, emit) => _onChangeProjectName(event, emit),
    );
  }

  void _onGetInfo(GetInfoEvent event,
      Emitter<DashboardScreenState> emit) async {

    var projects = await _projectsRepository.getProjects();
//    var cards = await _cardRepository.getCards();

    emit(state.data.copyWith(
      projects: projects,
    ));
  }

  void _onAddProject(AddProjectEvent event,
      Emitter<DashboardScreenState> emit) async {

    await _projectsRepository.addProject(event.name);
    await _updateProjects(emit);
  }

  void _onDelProject(DelProjectEvent event,
      Emitter<DashboardScreenState> emit) async {
    await _projectsRepository.delProject(event.index);
    await _updateProjects(emit);
  }

  void _onChangeProjectName(ChangeProjectNameEvent event,
      Emitter<DashboardScreenState> emit) async {
    await _projectsRepository.changeProjectName(
      event.index,
      event.name
    );
    await _updateProjects(emit);
  }

  Future<void> _updateProjects(Emitter<DashboardScreenState> emit) async {
    var projects = await _projectsRepository.getProjects();
    emit(state.data.copyWith(
      projects: projects,
    ));
  }



}
