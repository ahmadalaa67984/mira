import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class Vat extends FormzInput<String, VatValidationError>
    with EquatableMixin {
  const Vat.unvalidated([
    super.value = '',
  ]) : super.pure();

  const Vat.validated(super.value) : super.dirty();

  @override
  VatValidationError? validator(String value) {
    if (isPure) return null;
    if(value.isEmpty) return null;
    if (!(int.tryParse(value) != null) && value.isNotEmpty) {
      return VatValidationError.notInteger;
    }
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum VatValidationError {
  empty,
  notInteger,
}

