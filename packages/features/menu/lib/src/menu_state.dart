part of 'menu_cubit.dart';

class MenuState extends Equatable {
  const MenuState({
    this.shouldRememberCredentials = true,
    this.rememberMeLoading = false,
    this.email = const Email.unvalidated(),
    this.password = const Password.unvalidated(),
    this.submissionStatus = FormzSubmissionStatus.initial,
    this.user,
  });

  final bool shouldRememberCredentials;
  final bool rememberMeLoading;
  final Email email;
  final Password password;
  final FormzSubmissionStatus submissionStatus;
  final User? user;

  MenuState copyWith({
    bool? shouldRememberCredentials,
    bool? rememberMeLoading,
    Email? email,
    Password? password,
    FormzSubmissionStatus? submissionStatus,
    User? user,
  }) {
    return MenuState(
      shouldRememberCredentials:
          shouldRememberCredentials ?? this.shouldRememberCredentials,
      rememberMeLoading: rememberMeLoading ?? this.rememberMeLoading,
      email: email ?? this.email,
      password: password ?? this.password,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        shouldRememberCredentials,
        rememberMeLoading,
        email,
        password,
        submissionStatus,
        user,
      ];
}
