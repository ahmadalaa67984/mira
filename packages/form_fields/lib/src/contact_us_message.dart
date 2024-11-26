import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


class ContactUsMessage
    extends FormzInput<String?, ContactUsMessageValidationError>
    with EquatableMixin {
  const ContactUsMessage.unvalidated([
    super.value = '',
  ]) : super.pure();

  const ContactUsMessage.validated(super.value) : super.dirty();

  @override
  ContactUsMessageValidationError? validator(String? value) {
    if (isPure) return null;
    if (value == null) return ContactUsMessageValidationError.empty;
    if (value.isEmpty) return ContactUsMessageValidationError.empty;
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
      ];
}

enum ContactUsMessageValidationError {
  empty,
}
