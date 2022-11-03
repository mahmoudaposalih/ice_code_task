import 'package:hive/hive.dart';
part 'game_model.g.dart';

@HiveType(typeId: 0)
class GameModel {
  @HiveField(0)
  final String tittel;
  @HiveField(1)
  final String? descrption;
  @HiveField(2)
  final double? lat;
  @HiveField(3)
  final double? long;
  @HiveField(4)
  final String? address;
  @HiveField(5)
  final double maxPlayerCount;
  @HiveField(6)
  final DateTime gameDate;
  @HiveField(7)
  final String? image;
  @HiveField(8)
  final String id;
  GameModel(
      {required this.tittel,
      this.descrption,
      this.lat,
      this.long,
      required this.id,
      this.address,
      this.image,
      required this.maxPlayerCount,
      required this.gameDate});
}
