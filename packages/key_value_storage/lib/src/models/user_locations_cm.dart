import 'package:hive/hive.dart';
import 'package:key_value_storage/src/models/user_location_cm.dart';

part 'user_locations_cm.g.dart';

@HiveType(typeId: 11)
class UserLocationsCM {
  const UserLocationsCM({
    required this.list,
    this.selectedLocationId = 0,
  });

  @HiveField(0)
  final List<UserLocationCM> list;
  @HiveField(1)
  final int selectedLocationId;

  UserLocationsCM copyWithSelectedLocationId(int id) {
    return UserLocationsCM(
      list: list,
      selectedLocationId: id,
    );
  }
}
