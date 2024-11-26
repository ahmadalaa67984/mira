import 'package:json_annotation/json_annotation.dart';

part 'custom_field_rm.g.dart';

@JsonSerializable(createToJson: false)
class CustomFieldRM {
  CustomFieldRM({
    required this.id,
    required this.label,
    required this.name,
    required this.type,
    required this.options,
    required this.isRequired,

  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'label')
  final String label;
  // name is used when sencding back the request to the api
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'options')
  final List<String> options;
  @JsonKey(name: 'required')
  final String isRequired;


  static const fromJson = _$CustomFieldRMFromJson;
}
