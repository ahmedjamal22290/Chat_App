import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/dark_mode_cubit/mode_states.dart';

class modeCubit extends Cubit<modes> {
  modeCubit() : super(lightState());
  bool dark = false;

  void darkMode() {
    if (dark) {
      emit(darkState());
      dark = true;
    } else {
      dark = false;
      emit(lightState());
    }
  }
}
