import 'package:get_it/get_it.dart';
import 'package:todo_boards_macos/src/data/repository/card_repository.dart';
import 'package:todo_boards_macos/src/data/repository/projects_repository.dart';
import 'package:todo_boards_macos/src/data/source/database/cards_database.dart';
import 'package:todo_boards_macos/src/data/source/database/projects_database.dart';

void registerRepositories(GetIt getIt) {
  getIt
    ..registerSingleton<CardRepository>(
      CardRepository(
        getIt<CardDatabase>(),
      ),
    )
    ..registerSingleton<ProjectsRepository>(
      ProjectsRepository(
        getIt<ProjectDatabase>(),
      ),
    );
}