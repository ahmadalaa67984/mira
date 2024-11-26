import 'package:json_annotation/json_annotation.dart';

part 'life_cycles_rm.g.dart';

@JsonSerializable(createToJson: false)
class LifeCyclesRM {
  LifeCyclesRM({
    required this.contact,
    required this.company,
    required this.deal,
  });

  @JsonKey(name: 'contactLifeCycle')
  final List<String> contact;
  @JsonKey(name: 'companyLifeCycle')
  final List<String> company;
  @JsonKey(name: 'dealLifeCycle')
  final List<String> deal;

  static const fromJson = _$LifeCyclesRMFromJson;
}
