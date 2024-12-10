// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocationCMAdapter extends TypeAdapter<UserLocationCM> {
  @override
  final int typeId = 10;

  @override
  UserLocationCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocationCM(
      id: fields[0] as int,
      name: fields[1] as String,
      lat: fields[3] as double,
      lng: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocationCM obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocationCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
