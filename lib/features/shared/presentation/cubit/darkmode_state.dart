part of 'darkmode_cubit.dart';

class DarkmodeState extends Equatable {
  final bool isDarkMode;
  const DarkmodeState({this.isDarkMode = true});

  DarkmodeState copyWith({bool? isDarkMode}) =>
      DarkmodeState(isDarkMode: isDarkMode ?? this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];
}
