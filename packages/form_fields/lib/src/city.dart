import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


class City extends FormzInput<CityDM?, CityValidationError>
    with EquatableMixin {
  const City.unvalidated([
    super.value,
  ]) : super.pure();

  const City.validated([
    super.value,
  ]) : super.dirty();

  @override
  CityValidationError? validator(CityDM? value) {
    if (isPure) return null;
    if (value == null) {
      return CityValidationError.empty;
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

enum CityValidationError {
  empty,
}
