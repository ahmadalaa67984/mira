import 'package:hive/hive.dart';

part 'user_location_cm.g.dart';

@HiveType(typeId: 10)
class UserLocationCM {
  const UserLocationCM({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(3)
  final double lat;
  @HiveField(4)
  final double lng;
}
