import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_boards_macos/src/data/repository/card_repository.dart';
import 'package:todo_boards_macos/src/data/repository/projects_repository.dart';
import 'dashboard_models.dart';

class DashboardBloc extends Bloc<DashboardScreenEvent, DashboardScreenState> {
  final _projectsRepository = GetIt.instance<ProjectsRepository>();
  final _cardRepository = GetIt.instance<CardRepository>();

  DashboardBloc() : super(DashboardScreenState.data()) {
    on<GetInfoEvent>(
      (event, emit) => _onGetInfo(event, emit),
    );
    on<SetProjectEvent>(
      (event, emit) => _onSelectProject(event, emit),
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
    on<AddCardEvent>(
      (event, emit) => _onAddCard(event, emit),
    );
  }

  void _onGetInfo(
      GetInfoEvent event, Emitter<DashboardScreenState> emit) async {
    var projects = await _projectsRepository.getProjects();
    emit(state.data.copyWith(
      projects: projects,
    ));

    if (projects.isNotEmpty) {
      await _getAllProjectCards(emit, 0);
    }
  }

  void _onSelectProject(
      SetProjectEvent event, Emitter<DashboardScreenState> emit) async {
    // emit(state.data.copyWith(
    //   projectIndex: event.projectIndex,
    // ));
    await _getAllProjectCards(emit, event.projectIndex);
  }

  void _onAddProject(
      AddProjectEvent event, Emitter<DashboardScreenState> emit) async {
    await _projectsRepository.addProject(event.name);
    await _updateProjects(emit);
  }

  void _onDelProject(
      DelProjectEvent event, Emitter<DashboardScreenState> emit) async {
    await _projectsRepository.delProject(event.index);
    await _updateProjects(emit);
    await _getAllProjectCards(emit, event.index);
  }

  void _onChangeProjectName(
      ChangeProjectNameEvent event, Emitter<DashboardScreenState> emit) async {
    await _projectsRepository.changeProjectName(event.index, event.name);
    await _updateProjects(emit);
  }

  void _onAddCard(
      AddCardEvent event, Emitter<DashboardScreenState> emit) async {
    await _cardRepository.addCard(
      note: event.note,
      projectId: event.projectId,
      categoryId: event.categoryId,
    );
    await _updateCards(
      emit,
      event.projectId,
      event.categoryId,
    );
  }

  Future<void> _updateProjects(Emitter<DashboardScreenState> emit) async {
    var projects = await _projectsRepository.getProjects();
    emit(state.data.copyWith(
      projects: projects,
    ));
  }

  Future<void> _updateCards(
    Emitter<DashboardScreenState> emit,
    int projectId,
    int categoryId,
  ) async {
    var cards = await _cardRepository.getCardsByProjectAndCategory(
      projectId: projectId,
      categoryId: categoryId,
    );
    switch (categoryId) {
      case 0:
        emit(state.data.copyWith(
          cards1: cards,
        ));
        break;
      case 1:
        emit(state.data.copyWith(
          cards2: cards,
        ));
        break;
      case 2:
        emit(state.data.copyWith(
          cards3: cards,
        ));
        break;
    }
  }

  Future<void> _getAllProjectCards(
    Emitter<DashboardScreenState> emit,
    int projectId,
  ) async {
    var cards1 = await _cardRepository.getCardsByProjectAndCategory(
      projectId: projectId,
      categoryId: 0,
    );
    var cards2 = await _cardRepository.getCardsByProjectAndCategory(
      projectId: projectId,
      categoryId: 1,
    );
    var cards3 = await _cardRepository.getCardsByProjectAndCategory(
      projectId: projectId,
      categoryId: 2,
    );
    emit(state.data.copyWith(
      projectIndex: projectId,
      cards1: cards1,
      cards2: cards2,
      cards3: cards3,
    ));
  }
}
