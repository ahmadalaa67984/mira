import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


class Name extends FormzInput<String, NameValidationError> with EquatableMixin {
  const Name.unvalidated([
    super.value = '',
  ]) : super.pure();

  const Name.validated(super.value) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (isPure) return null;
    if (value.isEmpty) return NameValidationError.empty;
    if (value.length > 50) return NameValidationError.moreThanFifty;
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum NameValidationError {
  empty,
  moreThanFifty,
}
