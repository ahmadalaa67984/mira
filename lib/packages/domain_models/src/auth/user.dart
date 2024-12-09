import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final int id;

  final String? token;
  final String? password;

  const User({
    required this.name,
    required this.email,
    required this.id,
    required this.token,
    this.password,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        id,
        token,
      ];
}
