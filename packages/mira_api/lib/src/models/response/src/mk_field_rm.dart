import 'package:json_annotation/json_annotation.dart';

part 'mk_field_rm.g.dart';

@JsonSerializable(createToJson: false)
class MkFieldRM {
  MkFieldRM({
    required this.name,
    this.value,
    this.values = const [],
  });

  @JsonKey(name: 'key')
  final String name;
  @JsonKey(name: 'value', includeIfNull: false)
  final String? value;
  @JsonKey(name: 'values', includeIfNull: false)
  final List<String> values;

  static const fromJson = _$MkFieldRMFromJson;
}
