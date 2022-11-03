import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppInitial());

  void onUpdateData(String lang) {
    emit(AppData(lang: lang, changed: !state.changed));
  }
}
