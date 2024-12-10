import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class AccountName extends FormzInput<String, AccountNameValidationError>
    with EquatableMixin {
  const AccountName.unvalidated([
    super.value = '',
  ]) : super.pure();

  const AccountName.validated(super.value) : super.dirty();

  @override
  AccountNameValidationError? validator(String value) {
    if (isPure) return null;
    if (value.isEmpty) return AccountNameValidationError.empty;
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum AccountNameValidationError {
  empty,
}
