part of 'games_cubit.dart';

enum GetGamesStatus { initial, loading, success, failure }

enum AddGamesStatus { initial, loading, success, failure }

enum DeleteGameStatus { initial, loading, success, failure }

enum UpdateGameStatus { initial, loading, success, failure }

class GamesState extends Equatable {
  final List<GameModel>? games;

  final GetGamesStatus getGamesStatus;
  final AddGamesStatus addGamesStatus;
  final DeleteGameStatus deleteGameStatus;
  final UpdateGameStatus updategameStatus;
  final String? exception;
  const GamesState(
      {this.exception,
      this.getGamesStatus = GetGamesStatus.initial,
      this.addGamesStatus = AddGamesStatus.initial,
      this.deleteGameStatus = DeleteGameStatus.initial,
      this.updategameStatus = UpdateGameStatus.initial,
      this.games});
  @override
  List<Object?> get props => [
        exception,
        getGamesStatus,
        addGamesStatus,
        deleteGameStatus,
        updategameStatus,
        games
      ];
  GamesState copyWith(
      {List<GameModel>? games,
      GetGamesStatus? getGamesStatus,
      AddGamesStatus? addGamesStatus,
      DeleteGameStatus? deleteGameStatus,
      UpdateGameStatus? updategameStatus,
      String? exception}) {
    return GamesState(
        exception: exception ?? this.exception,
        games: games ?? this.games,
        getGamesStatus: getGamesStatus ?? this.getGamesStatus,
        addGamesStatus: addGamesStatus ?? this.addGamesStatus,
        deleteGameStatus: deleteGameStatus ?? this.deleteGameStatus,
        updategameStatus: updategameStatus ?? this.updategameStatus);
  }
}
