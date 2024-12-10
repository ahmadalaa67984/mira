// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_locations_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocationsCMAdapter extends TypeAdapter<UserLocationsCM> {
  @override
  final int typeId = 11;

  @override
  UserLocationsCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocationsCM(
      list: (fields[0] as List).cast<UserLocationCM>(),
      selectedLocationId: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocationsCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.list)
      ..writeByte(1)
      ..write(obj.selectedLocationId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocationsCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
