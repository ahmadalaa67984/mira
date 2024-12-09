import 'package:json_annotation/json_annotation.dart';

part 'user_signup_rm.g.dart';

@JsonSerializable(createFactory: false)
class UserSignUpRM {
  const UserSignUpRM({
    required this.email,
    required this.password,
    required this.userName,
    // required this.companyName,
    // required this.countryCode,
    // required this.productsList,
    // required this.phone,
    // required this.name,
    // required this.companySector,
    // required this.name,
    // required this.city,
    // required this.birthdate,
    // this.token = '',
    // required this.gender,
  });
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'username')
  final String userName;
  // @JsonKey(name: 'company_name')
  // final String companyName;
  // @JsonKey(name: 'country_code')
  // final String countryCode;
  // @JsonKey(name: 'products_list')
  // final String productsList;
  //
  // @JsonKey(name: 'phone')
  // final String phone;
  // @JsonKey(name: 'name')
  // final String name;
  // @JsonKey(name: 'company_sector')
  // final String companySector;
  // @JsonKey(name: 'username')
  // final String name;
  // @JsonKey(name: 'city')
  // final String city;
  // @JsonKey(name: 'birthDate')
  // final String birthdate;
  // @JsonKey(name: 'mktoken')
  // final String fcmToken;
  // @JsonKey(name: 'gender')
  // final String gender;

  Map<String, dynamic> toJson() => _$UserSignUpRMToJson(this);
}
