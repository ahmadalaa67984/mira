import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';
import 'package:formz/formz.dart';

class Cr extends FormzInput<String, CrValidationError>
    with EquatableMixin {
  const Cr.unvalidated([
    super.value = '',
  ]) : super.pure();

  const Cr.validated(super.value) : super.dirty();

  @override
  CrValidationError? validator(String value) {
    if (isPure) return null;
    if(value.isEmpty) return null;
    if (!(int.tryParse(value) != null)) return CrValidationError.notDouble;
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum CrValidationError {
  empty,
  notDouble,
}

