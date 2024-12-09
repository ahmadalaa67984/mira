import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mira/packages/domain_models/domain_models.dart';
import 'package:mira/packages/form_fields/form_fields.dart';
import 'package:mira/packages/user_repository/user_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.userRepository,
    required this.onSignUpSuccess,
  }) : super(
          const SignUpState(),
        );

  final UserRepository userRepository;
  final VoidCallback onSignUpSuccess;

  void onEmailChanged(String? newValue) {
    final previousEmail = state.email;
    final shouldValidate = previousEmail.isNotValid;
    final newState = state.copyWith(
      email: shouldValidate
          ? Email.validated(
              newValue,
            )
          : Email.unvalidated(
              newValue,
            ),
    );
    emit(newState);
  }

  void onPasswordChanged(String? newValue) {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final shouldValidate = previousPasswordState.isNotValid;
    final newPasswordState = shouldValidate
        ? Password.validated(
            shouldCheckStrength: false,
            newValue,
          )
        : Password.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      password: newPasswordState,
    );

    emit(newScreenState);
  }

  void onPasswordConfirmationChanged(String newValue) {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.passwordConfirmation;
    final shouldValidate = previousPasswordState.isNotValid;
    final newPasswordState = shouldValidate
        ? PasswordConfirmation.validated(newValue, password: state.password)
        : PasswordConfirmation.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      passwordConfirmation: newPasswordState,
    );

    emit(newScreenState);
  }

  void onPasswordUnfocused() {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final previousPasswordValue = previousPasswordState.value;

    final newPasswordState = Password.validated(
      previousPasswordValue,
      shouldCheckStrength: false,
      invalidCredentials: state.password.invalidCredentials,
    );
    final newScreenState = previousScreenState.copyWith(
      password: newPasswordState,
    );
    emit(newScreenState);
  }

  void onUserNameChanged(String newValue) {
    final previousScreenState = state;
    final previousUserNameState = previousScreenState.userName;
    final shouldValidate = previousUserNameState.isNotValid;
    final newUserNameState = shouldValidate
        ? UserName.validated(
            newValue,
          )
        : UserName.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      userName: newUserNameState,
    );

    emit(newScreenState);
  }

  void onSubmit() async {
    final email = Email.validated(state.email.value);
    final password = Password.validated(
      state.password.value,
      shouldCheckStrength: true,
    );
    final passwordConfirmation = PasswordConfirmation.validated(
        state.passwordConfirmation.value,
        password: state.password);
    final userName = UserName.validated(state.userName.value);
    final isFormValid = Formz.validate([
      email,
      userName,
      passwordConfirmation,
      password,
    ]);

    final newState = state.copyWith(
      email: email,
      password: password,
      userName: userName,
      passwordConfirmation: passwordConfirmation,
      submissionStatus: isFormValid ? FormzSubmissionStatus.inProgress : null,
    );

    emit(newState);

    if (isFormValid) {
      try {
        await userRepository.registerAndLogin(
          email: email.value!,
          password: password.value!,
          userName: userName.value!,
        );

        final newState = state.copyWith(
          submissionStatus: FormzSubmissionStatus.success,
        );
        emit(newState);
      } catch (error) {
        final newState = state.copyWith(
          password: Password.validated(
            password.value,
            shouldCheckStrength: false,
            invalidCredentials:
                error is InvalidCredentialsException ? true : false,
          ),
          email: Email.validated(
            email.value,
            isAlreadyRegistered:
                error is EmailAlreadyRegisteredException ? true : false,
          ),
          submissionStatus: FormzSubmissionStatus.initial,
        );
        emit(newState);
      }
    }
  }

// Future getRememberMeFromCache() async {
//   final rememberMeLoading = state.copyWith(rememberMeLoading: true);
//   emit(rememberMeLoading);
//
//   final rememberMe = await userRepository.getRememberedCredentials();
//   emit(state.copyWith(rememberMe: rememberMe));
//
//   final rememberMeLoadingDone = state.copyWith(rememberMeLoading: false);
//   emit(rememberMeLoadingDone);
// }

// @override
// Future<void> close() async {
//   return super.close();
// }
//   @override
//   Future<void> onChange(change) async {
//     print('+++++++${change.currentState.email}');
//     print('-------${change.nextState.email}');
//     super.onChange(change);
//   }
}
