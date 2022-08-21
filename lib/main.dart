import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:macos_ui/macos_ui.dart';
import 'src/core/di/injection.dart';
import 'src/data/model/local/card_model.dart';
import 'src/data/model/local/project_model.dart';
import 'src/presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'src/presentation/screens/dashboard/bloc/dashboard_models.dart';
import 'src/presentation/screens/dashboard/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeDatabase();
  initializeDi(GetIt.instance);
  await DesktopWindow.setMinWindowSize(const Size(800, 200));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      debugShowCheckedModeBanner: false,
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      home: BlocProvider(
        create: (_) => DashboardBloc()..add(GetInfoEvent()),
        child: const DashboardScreen()
      ),
    );
  }
}

Future<void> _initializeDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CardModelAdapter());
  Hive.registerAdapter(ProjectModelAdapter());
}