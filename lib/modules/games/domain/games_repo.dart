import 'package:hive/hive.dart';
import 'package:ice_code_task/modules/games/data/models/game_model.dart';

abstract class GamesRepo {
  Future<Box> oprenBox();
  List<GameModel> getGamesList(Box box);
  List<GameModel> sortGamesList();
  Future<void> addGametoList(Box box, GameModel game);
  Future<void> updateGameinList(Box box, String id, GameModel game);
  Future<void> removeProductFromList(
    Box box,
    String id,
  );
}
