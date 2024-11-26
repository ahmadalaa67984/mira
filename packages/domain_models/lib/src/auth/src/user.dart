import 'package:equatable/equatable.dart';

class User extends Equatable {
  // final int id;
  final String? username;
  // final String? lastName;
  // final String? slug;
  final String? email;
  // final String? jobTitle;
  // final String? phone;
  // final String? companyName;
  // final String? companyAddress;
  // final String? companyCountry;
  // final String? accountName;
  // final String? companyDomain;

  const User({
    // required this.id,
    this.username,
    // this.lastName,
    // this.slug,
    this.email,
    // this.jobTitle,
    // this.phone,
    // this.companyName,
    // this.companyAddress,
    // this.companyCountry,
    // this.accountName,
    // this.companyDomain,
  });

  @override
  List<Object?> get props => [
        // id,
        username,
        // lastName,
        // slug,
        email,
        // jobTitle,
        // phone,
        // companyName,
        // companyAddress,
        // companyCountry,
        // accountName,
        // companyDomain,
      ];
}
