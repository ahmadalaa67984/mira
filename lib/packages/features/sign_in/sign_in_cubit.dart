import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mira/packages/domain_models/src/exceptions.dart';
import 'package:mira/packages/form_fields/form_fields.dart';
import 'package:mira/packages/user_repository/user_repository.dart';


part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required this.userRepository,
    required this.onSignInSuccess,
  }) : super(
    const SignInState(),
  ) ;

  final UserRepository userRepository;
  final VoidCallback onSignInSuccess;

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

  void onEmailUnfocused() {
    final newState = state.copyWith(
      email: Email.validated(state.email.value,
          invalidCredentials: state.email.invalidCredentials,
          invalidFormat: state.email.invalidFormat),
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

  void onSubmit() async {
    // final email = Email.validated(state.email.value);
    final email = Email.validated(state.email.value);
    final password = Password.validated(
      state.password.value,
      shouldCheckStrength: false,
    );

    final isFormValid = Formz.validate([
      email,
      // email,
      password,
    ]);

    final newState = state.copyWith(
      email: email,
      // email: email,
      password: password,
      submissionStatus: isFormValid ? FormzSubmissionStatus.inProgress : null,
    );

    emit(newState);

    if (isFormValid) {
      try {
        await userRepository.signIn(
          email: email.value!,
          password: password.value!,
        );
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
            invalidCredentials:
            error is InvalidCredentialsException ? true : false,
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
