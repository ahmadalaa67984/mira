import 'package:json_annotation/json_annotation.dart';

part 'comment_rm.g.dart';

@JsonSerializable(createToJson: false)
class CommentRM {
  CommentRM({
    required this.author,
    required this.content,

  });

  @JsonKey(name: 'comment_author')
  final String author;
  @JsonKey(name: 'comment_content')
  final String content;




  static const fromJson = _$CommentRMFromJson;
}
