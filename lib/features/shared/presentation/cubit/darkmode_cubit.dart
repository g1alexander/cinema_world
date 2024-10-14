import 'package:cinema_world/features/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'darkmode_state.dart';

class DarkmodeCubit extends Cubit<DarkmodeState> {
  DarkmodeCubit() : super(const DarkmodeState());

  void setState(bool? isDarkMode) async {
    await KeyValueStorageServiceImpl()
        .setKeyValue('darkmode', isDarkMode ?? state.isDarkMode);
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  Future<void> getDarkMode() async {
    final isDarkMode =
        await KeyValueStorageServiceImpl().getValue<bool>('darkmode');

    emit(state.copyWith(isDarkMode: isDarkMode));
  }
}
