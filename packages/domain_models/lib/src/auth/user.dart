import 'package:domain_models/src/auth/gender.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final int id;
  final String phone;
  final String city;
  final String birthdate;
  final GenderDM gender;
  final bool isVerified;
  final String? token;
  final String? password;

  const User({
    required this.name,
    required this.email,
    required this.id,
    required this.phone,
    required this.city,
    required this.birthdate,
    required this.gender,
    required this.isVerified,
    required this.token,
    this.password,
  });

  @override
  List<Object?> get props => [
    name,
    email,
    id,
    phone,
    city,
    birthdate,
    gender,
    isVerified,
    token,
  ];

  // create copy with password method
  User copyWith({
    String? password,
    String? email,
  }) {
    return User(
      gender: gender,
      email: email ?? this.email,
      token: token,
      name: name,
      isVerified: isVerified,
      id: id,
      phone: phone,
      city: city,
      birthdate: birthdate,
      password: password ?? this.password,
    );
  }
}
