import '../data/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import './bloc/export.dart';
import './pages/home/home.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  RandomRepository randomRepository = RandomRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => RandomBloc(randomRepository)),
        ),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
