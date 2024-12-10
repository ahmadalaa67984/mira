// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRM _$CommentRMFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CommentRM',
      json,
      ($checkedConvert) {
        final val = CommentRM(
          author: $checkedConvert('comment_author', (v) => v as String),
          content: $checkedConvert('comment_content', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'author': 'comment_author',
        'content': 'comment_content'
      },
    );
