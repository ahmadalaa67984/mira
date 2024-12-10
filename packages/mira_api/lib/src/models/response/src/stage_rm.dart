import 'package:json_annotation/json_annotation.dart';

part 'stage_rm.g.dart';

@JsonSerializable(createToJson: false)
class DealStageRM {
  DealStageRM({
    required this.id,
    this.name,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String? name;

  static const fromJson = _$DealStageRMFromJson;
}
