import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/dark_mode_cubit/mode_states.dart';

class ModeCubit extends Cubit<Modes> {
  ModeCubit() : super(LightState());
  bool dark = false;
  void darkMode() {
    if (dark) {
      emit(DarkState());
    } else {
      emit(LightState());
    }
  }
}
