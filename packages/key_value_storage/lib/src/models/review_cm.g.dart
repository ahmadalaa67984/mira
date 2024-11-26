// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewCMAdapter extends TypeAdapter<ReviewCM> {
  @override
  final int typeId = 5;

  @override
  ReviewCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewCM(
      rate: fields[0] as double,
      comment: fields[1] as String,
      reviewerName: fields[2] as String,
      dateCreated: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewCM obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.rate)
      ..writeByte(1)
      ..write(obj.comment)
      ..writeByte(2)
      ..write(obj.reviewerName)
      ..writeByte(3)
      ..write(obj.dateCreated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
