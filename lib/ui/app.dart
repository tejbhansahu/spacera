import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacera/core/data_sources/rockets/rockets_local_data_source.dart';
import 'package:spacera/core/managers/core_manager.dart';
import 'package:spacera/locator.dart';
import 'package:spacera/provider_setup.dart';
import 'package:spacera/ui/shared/themes.dart' as themes;
import 'package:spacera/ui/views/landingPage/landingPage.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final RocketsLocalDataSource? rocketsLocalDataSource =
      locator<RocketsLocalDataSource>();

  @override
  void initState() {
    super.initState();
    handleStartUpLogic();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: CoreManager(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themes.primaryMaterialTheme,
          home: const LandingPage(),
        ),
      ),
    );
  }

  Future handleStartUpLogic() async {
    await Future.wait([
      rocketsLocalDataSource!.init(),
    ]);
  }
}
