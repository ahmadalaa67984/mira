import 'package:hive/hive.dart';
part 'review_cm.g.dart';

@HiveType(typeId: 5)
class ReviewCM {
  const ReviewCM({
    required this.rate,
    required this.comment,
    required this.reviewerName,
    required this.dateCreated,
  });

  @HiveField(0)
  final double rate;
  @HiveField(1)
  final String comment;
  @HiveField(2)
  final String reviewerName;
  @HiveField(3)
  final String dateCreated;
}
