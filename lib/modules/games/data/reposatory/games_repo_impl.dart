import 'package:ice_code_task/modules/games/data/models/game_model.dart';
import 'package:hive/hive.dart';
import 'package:ice_code_task/modules/games/domain/games_repo.dart';

class GamesRepoImpl implements GamesRepo {
  String boxName = "Games";
  @override
  Future<Box> oprenBox() async {
    Box box = await Hive.openBox<GameModel>(boxName);
    return box;
  }

  @override
  List<GameModel> getGamesList(Box box) {
    return box.values.toList() as List<GameModel>;
  }

  @override
  Future<void> addGametoList(Box box, GameModel game) {
    return box.add(game);
  }

  @override
  Future<void> updateGameinList(Box box, String id, GameModel game) {
    return box.put(id, game);
  }

  @override
  Future<void> removeProductFromList(Box box, String index) {
    return box.delete(index);
  }

  @override
  List<GameModel> sortGamesList() {
    throw UnimplementedError();
  }
}
