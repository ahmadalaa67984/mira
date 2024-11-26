import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


class Gender extends FormzInput<GenderDM?, GenderValidationError>
    with EquatableMixin {
  const Gender.unvalidated([
    super.value,
  ]) : super.pure();

  const Gender.validated([
    super.value,
  ]) : super.dirty();

  @override
  GenderValidationError? validator(GenderDM? value) {
    if (isPure) return null;
    if (value == null) {
      return GenderValidationError.empty;
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum GenderValidationError {
  empty,
}
