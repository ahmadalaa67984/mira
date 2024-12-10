import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class CompanyName extends FormzInput<String, CompanyNameValidationError>
    with EquatableMixin {
  const CompanyName.unvalidated([
    super.value = '',
  ])  : isDuplicate = false,
        super.pure();

  const CompanyName.validated(
    super.value, {
    this.isDuplicate = false,
  }) : super.dirty();

  final bool isDuplicate;

  @override
  CompanyNameValidationError? validator(String value) {
    if (isPure) return null;
    if (value.trim().isEmpty) return CompanyNameValidationError.empty;
    if (isDuplicate) return CompanyNameValidationError.duplicate;
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum CompanyNameValidationError {
  empty,
  duplicate,
}
