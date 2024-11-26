// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BranchCMAdapter extends TypeAdapter<BranchCM> {
  @override
  final int typeId = 3;

  @override
  BranchCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BranchCM(
      id: fields[0] as int,
      title: fields[1] as String?,
      address: fields[2] as String?,
      phone: fields[3] as String?,
      lat: fields[4] as double?,
      lng: fields[5] as double?,
      geoUri: fields[6] as Uri?,
      startTime: fields[7] as String?,
      endTime: fields[8] as String?,
      startDay: fields[9] as String?,
      endDay: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BranchCM obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.lat)
      ..writeByte(5)
      ..write(obj.lng)
      ..writeByte(6)
      ..write(obj.geoUri)
      ..writeByte(7)
      ..write(obj.startTime)
      ..writeByte(8)
      ..write(obj.endTime)
      ..writeByte(9)
      ..write(obj.startDay)
      ..writeByte(10)
      ..write(obj.endDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BranchCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
