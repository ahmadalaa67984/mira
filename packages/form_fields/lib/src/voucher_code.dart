

import 'package:formz/formz.dart';

class VoucherCode extends FormzInput<String, VoucherCodeValidationError> {
  const VoucherCode.unvalidated([
    super.value = '',
  ]) : super.pure();

  const VoucherCode.validated([
    super.value = '',
  ]) : super.dirty();

  @override
  VoucherCodeValidationError? validator(String value) {
    if (isPure) return null;
    if (value.trim().isEmpty) return VoucherCodeValidationError.empty;
    if (value.length < 30) return VoucherCodeValidationError.incomplete;

    return null;
  }
}

enum VoucherCodeValidationError {
  empty,
  incomplete,
  invalid, incorrect
}
