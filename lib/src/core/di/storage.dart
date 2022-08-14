import 'package:get_it/get_it.dart';
import 'package:todo_boards_macos/src/data/source/database/cards_database.dart';
import 'package:todo_boards_macos/src/data/source/database/projects_database.dart';

void registerStorage(GetIt getIt) {
  getIt
    ..registerSingleton<CardDatabase>(CardDatabase())
    ..registerSingleton<ProjectDatabase>(ProjectDatabase());
}