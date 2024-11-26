import 'package:hive/hive.dart';

part 'rating_cm.g.dart';

@HiveType(typeId: 4)
class RatingCM {
  const RatingCM({
    required this.averageRating,
    required this.ratingCount,
    this.countInArabic,
  });

  @HiveField(0)
  final String averageRating;
  @HiveField(1)
  final int ratingCount;
  @HiveField(2)
  final String? countInArabic;
}


