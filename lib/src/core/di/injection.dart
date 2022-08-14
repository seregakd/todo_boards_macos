import 'package:get_it/get_it.dart';
import 'repositories.dart';
import 'storage.dart';

void initializeDi(GetIt getIt) {
  registerStorage(getIt);
  registerRepositories(getIt);
}