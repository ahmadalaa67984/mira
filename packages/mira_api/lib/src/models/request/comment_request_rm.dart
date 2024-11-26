import 'package:json_annotation/json_annotation.dart';

part 'comment_request_rm.g.dart';

@JsonSerializable(createFactory: false)
class CommentRequestRM {
  const CommentRequestRM({
    required this.activityId,
    required this.content,
    required this.userId,
  });

  @JsonKey(name: 'post_id')
  final int activityId;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'user_id')
  final int userId;

  Map<String, dynamic> toJson() => _$CommentRequestRMToJson(this);
}

