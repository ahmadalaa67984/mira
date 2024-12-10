import 'dart:async';

import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';

import 'package:user_repository/user_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.userRepository,
    required this.onSignUpSuccess,
  }) : super(
    const SignUpState(),
  ) ;

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

  // void onEmailUnfocused() {
  //   final newState = state.copyWith(
  //     email: Email.validated(state.email.value,
  //         invalidCredentials: state.email.invalidCredentials,
  //         invalidFormat: state.email.invalidFormat),
  //   );
  //
  //   emit(newState);
  // }

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
  void onPasswordConfirmationChanged(String newValue ) {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.passwordConfirmation;
    final shouldValidate = previousPasswordState.isNotValid;
    final newPasswordState = shouldValidate
        ? PasswordConfirmation.validated(
      newValue,
      password: state.password
    )
        : PasswordConfirmation.unvalidated(
      newValue,
    ) ;

    final newScreenState = state.copyWith(
      passwordConfirmation: newPasswordState,
    );

    emit(newScreenState);
  }
  // void onPasswordConfirmationChanged(String? newValue, Password password) {
  //   if (newValue == null) {
  //     // Handle the null case as needed, e.g., return early or set a specific state
  //     return;
  //   }
  //
  //   final previousPasswordState = state.passwordConfirmation;
  //   final shouldValidate = previousPasswordState.isNotValid;
  //
  //   final newPasswordConfirmState = shouldValidate
  //       ? PasswordConfirmation.validated(
  //     newValue, // Now, newValue is guaranteed to be non-null
  //     password: password,
  //   )
  //       : PasswordConfirmation.unvalidated(
  //     newValue,
  //   );
  //
  //   final newScreenState = state.copyWith(
  //     passwordConfirmation: newPasswordConfirmState,
  //   );
  //
  //   emit(newScreenState);
  // }
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

  void rememberMeEmitter(bool shouldRememberCredentials) {
    emit(state.copyWith(shouldRememberCredentials: shouldRememberCredentials));
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
    // final email = Email.validated(state.email.value);
    final email = Email.validated(state.email.value);
    final password = Password.validated(
      state.password.value,
      shouldCheckStrength: true,
    );
    final passwordConfirmation=PasswordConfirmation.validated(state.passwordConfirmation.value, password: state.password);
    final userName=UserName.validated(state.userName.value);
    final isFormValid = Formz.validate([
      email,
      userName,
      passwordConfirmation,
      password,
    ]);

    final newState = state.copyWith(
      email: email,
      // email: email,
      password: password,
      userName:userName,
      passwordConfirmation:passwordConfirmation,
      submissionStatus: isFormValid ? FormzSubmissionStatus.inProgress : null,
    );

    emit(newState);

    if (isFormValid) {
      try {
        await userRepository.registerAndLogin(
          email: email.value!,
          password: password.value!,
          userName: userName.value!
          // phone:"043342532",
          // name:'asfsafs',
          //   companySector:'afsaf',
          // code:'+996',
        );
        // await Future.delayed(Duration(seconds: 2));
        if (state.shouldRememberCredentials) {
          userRepository.cacheRememberedCredentials(
            // email: email.value!,
            email: email.value!,
            password: password.value!,
          );
        } else {
          userRepository.deleteRememberedCredentials();
        }
        /// This is to notify the [OrderHistoryScreen] to fetch the user orders
        /// when logging in and clear the value to prevent multiple api calls
        // TODO: clean the full voucher and vendor profile history so the favourites are updated when the user visits a full voucher or vendor
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
          // email: Email.validated(
          //   email.value,
          //   invalidCredentials:
          //       error is InvalidCredentialsException ? true : false,
          //   invalidFormat: error is InvalidEmailFormatException ? true : false,
          // ),
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
