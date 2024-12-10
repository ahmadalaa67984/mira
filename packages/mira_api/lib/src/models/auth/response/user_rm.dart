import 'package:json_annotation/json_annotation.dart';

part 'user_rm.g.dart';

@JsonSerializable()
class UserRM {
  UserRM({
    required this.username,
    required this.email,
    // required this.id,
    // required this.phone,
    // required this.city,
    // required this.birthdate,
    // required this.gender,
    // this.isVerified,
    // this.token,
    // this.favProducts,
    // this.favVendors,

  });

  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'email')
  final String email;
  // @JsonKey(name: 'id')
  // final dynamic id;
  // @JsonKey(name: 'phone')
  // final String phone;
  // @JsonKey(name: 'city')
  // final String city;
  // @JsonKey(name: 'birthDate')
  // final String birthdate;
  // @JsonKey(name: 'gender')
  // final String gender;
  // @JsonKey(name: 'verified')
  // final String? isVerified;
  // @JsonKey(name: 'auth')
  // final String? token;
  // @JsonKey(name: 'favProducts')
  // final dynamic favProducts;
  // @JsonKey(name: 'favVendors')
  // final dynamic favVendors;


  static const fromJson = _$UserRMFromJson;

  Map<String, dynamic> toJson() => _$UserRMToJson(this);

  UserRM copyWithFavourites() {
    return UserRM(
      username: username,
      email: email,
      // id: id,
      // phone: phone,
      // city: city,
      // isVerified: isVerified,
      // birthdate: birthdate,
      // gender: gender,
      // favProducts: favProducts,
      // favVendors: favVendors,

    );
  }


}
