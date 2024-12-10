import 'package:hive/hive.dart';
part 'voucher_status_cm.g.dart';

@HiveType(typeId: 6)
enum VoucherStatusCM {
  @HiveField(0)
  active,
  @HiveField(1)
  used,
  @HiveField(2)
  expired
}
