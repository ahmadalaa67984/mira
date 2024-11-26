// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_status_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VoucherStatusCMAdapter extends TypeAdapter<VoucherStatusCM> {
  @override
  final int typeId = 6;

  @override
  VoucherStatusCM read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VoucherStatusCM.active;
      case 1:
        return VoucherStatusCM.used;
      case 2:
        return VoucherStatusCM.expired;
      default:
        return VoucherStatusCM.active;
    }
  }

  @override
  void write(BinaryWriter writer, VoucherStatusCM obj) {
    switch (obj) {
      case VoucherStatusCM.active:
        writer.writeByte(0);
        break;
      case VoucherStatusCM.used:
        writer.writeByte(1);
        break;
      case VoucherStatusCM.expired:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoucherStatusCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
