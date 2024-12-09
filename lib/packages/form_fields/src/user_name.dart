import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


class UserName extends FormzInput<String?, UserNameValidationError>
    with EquatableMixin {
  const UserName.unvalidated([
    super.value = '',
  ]) : super.pure();

  const UserName.validated(super.value) : super.dirty();

  @override
  UserNameValidationError? validator(String? value) {
    if (isPure) return null;
    if (value == null) return UserNameValidationError.empty;
    if (value.isEmpty) return UserNameValidationError.empty;
    return null;
  }

  @override
  List<Object?> get props => [
    value,
    isPure,
  ];
}

enum UserNameValidationError {
  empty,
}
