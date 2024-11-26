import 'package:formz/formz.dart';

class Birthdate extends FormzInput<String, BirthDateValidationError> {
  const Birthdate.unvalidated([
    super.value = '',
  ]) : super.pure();

  const Birthdate.validated([
    super.value = '',
  ]) : super.dirty();

  @override
  BirthDateValidationError? validator(String value) {
    if (isPure) return null;
    if (value.isEmpty) {
      return BirthDateValidationError.empty;
    } else {
      return null;
    }
  }
}

enum BirthDateValidationError {
  empty,
}
