import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class DealName extends FormzInput<String, DealNameValidationError>
    with EquatableMixin {
  const DealName.unvalidated([
    super.value = '',
  ])  : isDuplicate = false,
        super.pure();

  const DealName.validated(
      super.value, {

        this.isDuplicate = false,
      }) : super.dirty();

  final bool isDuplicate;
  @override
  DealNameValidationError? validator(String value) {
    if (isPure) return null;
    if (value.trim().isEmpty) return DealNameValidationError.empty;
    if (isDuplicate) return DealNameValidationError.duplicate;
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum DealNameValidationError {
  empty,
  duplicate,
}
