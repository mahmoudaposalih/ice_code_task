part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  final String lang;
  final bool changed;
  const AppState({required this.lang, required this.changed});
}

class AppInitial extends AppState {
  const AppInitial() : super(lang: "ar", changed: false);
  @override
  List<dynamic> get props => [lang, changed];
}

class AppData extends AppState {
  const AppData({required String lang, required bool changed})
      : super(lang: lang, changed: changed);
  @override
  List<dynamic> get props => [lang, changed];
}
