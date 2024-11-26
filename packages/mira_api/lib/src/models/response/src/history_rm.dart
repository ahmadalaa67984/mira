import 'package:json_annotation/json_annotation.dart';

part 'history_rm.g.dart';

@JsonSerializable(createToJson: false)
class HistoryRM {
  HistoryRM({
    required this.type,
    required this.title,

  });

  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'title')
  final String title;




  static const fromJson = _$HistoryRMFromJson;
}
