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
      (event, emit) => _onSetProject(event, emit),
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
    on<DelCardEvent>(
          (event, emit) => _onDelCard(event, emit),
    );
    on<ChangeCardEvent>(
          (event, emit) => _onChangeCard(event, emit),
    );
  }

  void _onGetInfo(
      GetInfoEvent event, Emitter<DashboardScreenState> emit) async {
    var projects = await _projectsRepository.getProjects();
    emit(state.data.copyWith(
      projects: projects,
    ));

    if (projects.isNotEmpty) {
      await _getAllProjectCards(
        emit: emit,
        projectIndex: 0,
        projectKey: projects[0].key,
      );
    }
  }

  void _onSetProject(
      SetProjectEvent event, Emitter<DashboardScreenState> emit) async {

    await _getAllProjectCards(
        emit: emit,
        projectIndex: event.projectIndex,
        projectKey: state.projects[event.projectIndex].key,
    );
  }

  void _onAddProject(
      AddProjectEvent event, Emitter<DashboardScreenState> emit) async {
    await _projectsRepository.addProject(event.name);
    await _updateProjects(emit);
  }

  void _onDelProject(
      DelProjectEvent event, Emitter<DashboardScreenState> emit) async {
    await _delAllCardsInProject(state.projects[event.index].key);

    int index = event.index;
    await _projectsRepository.delProject(event.index);

    if (index == state.projects.length - 1 && index != 0) {
      index = index - 1;
      emit(state.data.copyWith(
        projectIndex: index,
        projectKey: state.projects[index].key,
      ));
    }
    await _updateProjects(emit);
    await _getAllProjectCards(
        emit: emit,
        projectIndex: index,
        projectKey: state.projects.isNotEmpty ? state.projects[index].key : -1,
    );
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

  void _onDelCard(
      DelCardEvent event, Emitter<DashboardScreenState> emit) async {
    await _cardRepository.delCard(event.key);

    await _updateCards(
      emit,
      state.projectKey,
      event.categoryId,
    );
  }

  void _onChangeCard(
      ChangeCardEvent event, Emitter<DashboardScreenState> emit) async {
    await _cardRepository.changeCard(
      key: event.key,
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
    if (projects.length == 1) {
      emit(state.data.copyWith(
        projectKey: projects[0].key,
      ));
    }
    emit(state.data.copyWith(
      projects: projects,
    ));
  }

  Future<void> _updateCards(
    Emitter<DashboardScreenState> emit,
    int projectKey,
    int categoryId,
  ) async {
    var cards = await _cardRepository.getCardsByProjectAndCategory(
      projectId: projectKey,
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

  Future<void> _getAllProjectCards({
    required Emitter<DashboardScreenState> emit,
    required int projectIndex,
    required int projectKey,
  }) async {
    var cards1 = await _cardRepository.getCardsByProjectAndCategory(
      projectId: projectKey,
      categoryId: 0,
    );
    var cards2 = await _cardRepository.getCardsByProjectAndCategory(
      projectId: projectKey,
      categoryId: 1,
    );
    var cards3 = await _cardRepository.getCardsByProjectAndCategory(
      projectId: projectKey,
      categoryId: 2,
    );

    emit(state.data.copyWith(
      projectIndex: projectIndex,
      projectKey: projectKey,
      cards1: cards1,
      cards2: cards2,
      cards3: cards3,
    ));
  }

  Future<void> _delAllCardsInProject(int projectId) async {
    var cards = await _cardRepository.getCardsByProject(
      projectId: projectId,
    );

    for (var item in cards) {
      await _cardRepository.delCard(item.key);
    }
  }

}
