import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class DealValue extends FormzInput<String, DealValueValidationError>
    with EquatableMixin {
  const DealValue.unvalidated([
    super.value = '',
  ]) : super.pure();

  const DealValue.validated(super.value) : super.dirty();

  @override
  DealValueValidationError? validator(String value) {
    if (isPure) return null;
    if (value.isEmpty) return DealValueValidationError.empty;
    if (!(int.tryParse(value) != null)) {
      return DealValueValidationError.notInteger;
    }
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum DealValueValidationError {
  empty,
  notInteger,
}
