import 'package:equatable/equatable.dart';
import 'package:form_fields/src/compulsoriness.dart';
import 'package:formz/formz.dart';

class Mobile extends FormzInput<String?, MobileValidationError>
    with EquatableMixin {
  const Mobile.unvalidated([
    super.value = '',
  ])  : isAlreadyRegistered = false,
        notRegistered = false,
        invalidCredentials = false,
        compulsoriness = Compulsoriness.required,
        super.pure();

  const Mobile.validated(
    super.value, {
    this.isAlreadyRegistered = false,
    this.notRegistered = false,
    this.invalidCredentials = false,
    this.compulsoriness = Compulsoriness.required,
  }) : super.dirty();

  // static final _mobileRegex = RegExp(
  //   '^[1-7][0-9]{7}\$',
  // );
  static final _mobileRegex = RegExp(
    r'^(011|012|013|014|016|017)\d{7}$|'
    r'^(05)\d{8}$',
  );

  final bool invalidCredentials;
  final bool notRegistered;
  final bool isAlreadyRegistered;
  final Compulsoriness compulsoriness;

  bool get isRequired => compulsoriness == Compulsoriness.required;

  @override
  MobileValidationError? validator(String? value) {
    if (isPure) return null;
    if (value?.isEmpty == true && isRequired) {
      return MobileValidationError.empty;
    }
    if (value?.isEmpty == true && !isRequired) return null;

    if (isAlreadyRegistered) return MobileValidationError.alreadyRegistered;
    if (notRegistered) return MobileValidationError.notRegistered;
    // if (!_mobileRegex.hasMatch(value ?? '')) {
    //   return MobileValidationError.invalidFormat;
    // }
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
        isAlreadyRegistered,
        notRegistered,
        compulsoriness,
      ];
}

enum MobileValidationError {
  empty,
  invalidFormat,
  alreadyRegistered,
  notRegistered,
  invalidCredentials,
}
