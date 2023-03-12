import 'package:bloc/bloc.dart';

class MyObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('$bloc => $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('$bloc => $error');
    print('$bloc => $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('$bloc => $transition');
    super.onTransition(bloc, transition);
  }
}
