import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(transition.toString());
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    //for Cubits
    super.onChange(bloc, change);
    log(change.toString());
  }
}
