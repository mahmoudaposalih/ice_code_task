import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../modules/games/data/models/game_model.dart';

class HiveHelper {
  static init() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(GameModelAdapter());
  }
}
