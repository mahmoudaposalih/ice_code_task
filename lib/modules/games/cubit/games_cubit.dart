import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:ice_code_task/modules/games/data/models/game_model.dart';

import '../domain/games_repo.dart';

part 'games_state.dart';

class GamesCubit extends Cubit<GamesState> {
  GamesRepo gamesRepo;
  GamesCubit({required this.gamesRepo}) : super(const GamesState());

  Future<void> getGamesList() async {
    emit(state.copyWith(getGamesStatus: GetGamesStatus.loading));
    try {
      Box box = await gamesRepo.oprenBox();

      List<GameModel> games = gamesRepo.getGamesList(box);
      emit(
          state.copyWith(getGamesStatus: GetGamesStatus.success, games: games));
    } catch (e) {
      emit(state.copyWith(
          getGamesStatus: GetGamesStatus.failure, exception: e.toString()));
    }
  }

  Future addGametoList(GameModel game) async {
    emit(state.copyWith(
        addGamesStatus: AddGamesStatus.loading,
        getGamesStatus: GetGamesStatus.loading));
    try {
      Box box = await gamesRepo.oprenBox();
      gamesRepo.addGametoList(box, game);
      emit(state.copyWith(
          addGamesStatus: AddGamesStatus.success,
          getGamesStatus: GetGamesStatus.success,
          games: (state.games ?? [])..insert(0, game)));
      return true;
    } catch (e) {
      emit(state.copyWith(
          getGamesStatus: GetGamesStatus.failure, exception: e.toString()));
      return e.toString();
    }
  }

  Future<void> removeProductFromList(String id) async {
    emit(state.copyWith(deleteGameStatus: DeleteGameStatus.loading));
    try {
      Box box = await gamesRepo.oprenBox();
      gamesRepo.removeProductFromList(box, id);
      emit(state.copyWith(
          deleteGameStatus: DeleteGameStatus.success,
          games: (state.games ?? [])
            ..removeWhere((element) => element.id == id)));
    } catch (e) {
      emit(state.copyWith(
          deleteGameStatus: DeleteGameStatus.failure, exception: e.toString()));
    }
  }

  void sortGamesListByData() {
    emit(state.copyWith(getGamesStatus: GetGamesStatus.loading));
    List<GameModel> games = state.games!;
    games.sort((b, a) {
      return a.gameDate.compareTo(b.gameDate);
    });
    emit(state.copyWith(getGamesStatus: GetGamesStatus.success, games: games));
  }

  void sortGamesListByTittel() {
    emit(state.copyWith(getGamesStatus: GetGamesStatus.loading));
    List<GameModel> games = state.games!;
    games.sort((a, b) {
      return a.tittel.toLowerCase().compareTo(b.tittel.toLowerCase());
    });

    emit(state.copyWith(getGamesStatus: GetGamesStatus.success, games: games));
  }

  Future<bool> updateGameinList(String id, GameModel game) async {
    emit(state.copyWith(
        updategameStatus: UpdateGameStatus.loading,
        getGamesStatus: GetGamesStatus.loading));
    try {
      Box box = await gamesRepo.oprenBox();
      gamesRepo.updateGameinList(box, id, game);
      List<GameModel> games = state.games!;
      games[games.indexWhere((element) => element.id == id)] = game;
      emit(state.copyWith(
          updategameStatus: UpdateGameStatus.success,
          getGamesStatus: GetGamesStatus.success,
          games: games));
      return true;
    } catch (e) {
      emit(state.copyWith(
          updategameStatus: UpdateGameStatus.failure, exception: e.toString()));
      return false;
    }
  }
}
