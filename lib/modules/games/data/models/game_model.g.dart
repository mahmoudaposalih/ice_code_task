// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameModelAdapter extends TypeAdapter<GameModel> {
  @override
  final int typeId = 0;

  @override
  GameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameModel(
      tittel: fields[0] as String,
      descrption: fields[1] as String?,
      lat: fields[2] as double?,
      long: fields[3] as double?,
      id: fields[8] as String,
      address: fields[4] as String?,
      image: fields[7] as String?,
      maxPlayerCount: fields[5] as double,
      gameDate: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, GameModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.tittel)
      ..writeByte(1)
      ..write(obj.descrption)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.long)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.maxPlayerCount)
      ..writeByte(6)
      ..write(obj.gameDate)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
