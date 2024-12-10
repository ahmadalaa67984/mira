import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class Website extends FormzInput<String, WebsiteValidationError>
    with EquatableMixin {
  const Website.unvalidated([
    super.value = '',
  ]) : super.pure();

  const Website.validated(super.value) : super.dirty();

  @override
  WebsiteValidationError? validator(String value) {
    if (isPure) return null;
    if (value.isEmpty) return WebsiteValidationError.empty;
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum WebsiteValidationError {
  empty,
}
