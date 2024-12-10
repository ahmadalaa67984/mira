import 'package:hive/hive.dart';
part 'branch_cm.g.dart';

@HiveType(typeId: 3)
class BranchCM {
  const BranchCM({
    required this.id,
    this.title,
    this.address,
    this.phone,
    this.lat,
    this.lng,
    this.geoUri,
    this.startTime,
    this.endTime,
    this.startDay,
    this.endDay,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  final String? phone;
  @HiveField(4)
  final double? lat;
  @HiveField(5)
  final double? lng;
  @HiveField(6)
  final Uri? geoUri;
  @HiveField(7)
  final String? startTime;
  @HiveField(8)
  final String? endTime;
  @HiveField(9)
  final String? startDay;
  @HiveField(10)
  final String? endDay;
}
