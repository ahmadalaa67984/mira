part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.shouldRememberCredentials = true,
    this.rememberMeLoading = false,
    this.appDependenciesFetchStatus = AppDependenciesFetchStatus.initial,
    this.email = const Email.unvalidated(),
    this.password = const Password.unvalidated(),
    this.userName = const UserName.unvalidated(),
    this.passwordConfirmation = const PasswordConfirmation.unvalidated(),
    this.submissionStatus = FormzSubmissionStatus.initial,
  });

  final bool shouldRememberCredentials;
  final bool rememberMeLoading;
  final AppDependenciesFetchStatus appDependenciesFetchStatus;
  final Email email;
  final Password password;
  final UserName userName;
  final FormzSubmissionStatus submissionStatus;
  final PasswordConfirmation passwordConfirmation;

  SignUpState copyWith({
    bool? shouldRememberCredentials,
    bool? rememberMeLoading,
    AppDependenciesFetchStatus? appDependenciesFetchStatus,
    Email? email,
    Password? password,
    UserName? userName,
    FormzSubmissionStatus? submissionStatus,
    PasswordConfirmation? passwordConfirmation,
  }) {
    return SignUpState(
      shouldRememberCredentials:
          shouldRememberCredentials ?? this.shouldRememberCredentials,
      rememberMeLoading: rememberMeLoading ?? this.rememberMeLoading,
      appDependenciesFetchStatus:
          appDependenciesFetchStatus ?? this.appDependenciesFetchStatus,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  @override
  List<Object?> get props => [
        shouldRememberCredentials,
        rememberMeLoading,
        appDependenciesFetchStatus,
        email,
        password,
        userName,
        submissionStatus,
        passwordConfirmation,
      ];
}

enum AppDependenciesFetchStatus {
  initial,
  inProgress,
  success,
  error,
}
