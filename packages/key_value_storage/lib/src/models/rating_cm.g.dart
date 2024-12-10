// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatingCMAdapter extends TypeAdapter<RatingCM> {
  @override
  final int typeId = 4;

  @override
  RatingCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingCM(
      averageRating: fields[0] as String,
      ratingCount: fields[1] as int,
      countInArabic: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RatingCM obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.averageRating)
      ..writeByte(1)
      ..write(obj.ratingCount)
      ..writeByte(2)
      ..write(obj.countInArabic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
