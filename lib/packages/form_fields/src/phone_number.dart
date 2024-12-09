import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError>
    with EquatableMixin {
  const PhoneNumber.unvalidated([
    super.value = '',
  ]) : super.pure();

  const PhoneNumber.validated(super.value) : super.dirty();

  @override
  PhoneNumberValidationError? validator(String value) {
    if (isPure) return null;
    if (value.isEmpty) return PhoneNumberValidationError.empty;
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum PhoneNumberValidationError {
  empty,
}
