part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({
    this.shouldRememberCredentials = true,
    this.rememberMeLoading = false,
    this.appDependenciesFetchStatus = AppDependenciesFetchStatus.initial,
    this.email = const Email.unvalidated(),
    this.password = const Password.unvalidated(),
    this.submissionStatus = FormzSubmissionStatus.initial,
  });

  final bool shouldRememberCredentials;
  final bool rememberMeLoading;
  final AppDependenciesFetchStatus appDependenciesFetchStatus;
  final Email email;
  final Password password;
  final FormzSubmissionStatus submissionStatus;

  SignInState copyWith({
    bool? shouldRememberCredentials,
    bool? rememberMeLoading,
    AppDependenciesFetchStatus? appDependenciesFetchStatus,
    Email? email,
    Password? password,
    FormzSubmissionStatus? submissionStatus,
  }) {
    return SignInState(
      shouldRememberCredentials:
      shouldRememberCredentials ?? this.shouldRememberCredentials,
      rememberMeLoading: rememberMeLoading ?? this.rememberMeLoading,
      appDependenciesFetchStatus:
      appDependenciesFetchStatus ?? this.appDependenciesFetchStatus,
      email: email ?? this.email,
      password: password ?? this.password,
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
    submissionStatus,
  ];
}

enum AppDependenciesFetchStatus {
  initial,
  inProgress,
  success,
  error,
}
