import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'darkmode_state.dart';

class DarkmodeCubit extends Cubit<DarkmodeState> {
  DarkmodeCubit() : super(const DarkmodeState());

  void setState(bool? isDarkMode) =>
      emit(state.copyWith(isDarkMode: isDarkMode));
}
