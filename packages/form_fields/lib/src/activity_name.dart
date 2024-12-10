import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ActivityName extends FormzInput<String, ActivityNameValidationError>
    with EquatableMixin {
  const ActivityName.unvalidated([
    super.value = '',
  ]) : super.pure();

  const ActivityName.validated(super.value) : super.dirty();

  @override
  ActivityNameValidationError? validator(String value) {
    if (isPure) return null;
    if (value.isEmpty) return ActivityNameValidationError.empty;
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum ActivityNameValidationError {
  empty,
}
