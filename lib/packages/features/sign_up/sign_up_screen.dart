import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mira/packages/component_library/component_library.dart';
import 'package:mira/packages/features/sign_up/sign_up_cubit.dart';
import 'package:mira/packages/form_fields/form_fields.dart';
import 'package:mira/packages/user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.userRepository,
    required this.onSignInTap,
    required this.onSignUpSuccess,
  });

  final UserRepository userRepository;
  final VoidCallback onSignInTap;
  final VoidCallback onSignUpSuccess;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<SignUpCubit>(
      create: (_) => SignUpCubit(
        userRepository: widget.userRepository,
        onSignUpSuccess: widget.onSignUpSuccess,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus,
        child: SignUpView(
          onSignInTap: widget.onSignInTap,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
    required this.onSignInTap,
  });

  final VoidCallback onSignInTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        final cubit = context.read<SignUpCubit>();
        if (state.submissionStatus == FormzSubmissionStatus.success) {
          cubit.onSignUpSuccess();
        }
      },
      builder: (context, state) {
        final theme = MiraTheme.of(context);
        final textTheme = Theme.of(context).textTheme;
        // final textTheme = Theme.of(context).textTheme;
        final subInProg =
            state.submissionStatus == FormzSubmissionStatus.inProgress;
        final cubit = context.read<SignUpCubit>();
        final emailError = state.email.isNotValid ? state.email.error : null;

        final userNameError =
            state.userName.isNotValid ? state.userName.error : null;
        final passwordError =
            state.password.isNotValid ? state.password.error : null;
        final passwordConfirmationError = state.passwordConfirmation.isNotValid
            ? state.passwordConfirmation.error
            : null;

        return Scaffold(
          appBar: const MiraAppBar(),
          extendBodyBehindAppBar: true, // Extend the body behind the AppBar
          body: Stack(
            children: [
              // Expanded(
              //     child: Container(
              //   color: Colors.black.withOpacity(0.7),
              // )),
              Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: theme.screenMargin,
                    vertical: Spacing.large,
                  ),
                  children: [
                    Center(
                      child: Text('تسجيل حساب',
                          style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                              color: Colors.white)),
                    ),
                    VerticalGap.large(),
                    TextField(
                      style: const TextStyle(
                        color:
                            Colors.black, // Sets the input text color to white
                      ),
                      onChanged: (text) {
                        cubit.onEmailChanged(text);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Spacing.small,
                          vertical: Spacing.small,
                        ),
                        filled: true,
                        isDense: true,
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 0,
                        ),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        hintStyle: const TextStyle(color: Colors.black),

                        hintText: 'ايميل',
                        errorText: emailError == EmailValidationError.empty
                            ? 'مطلوب'
                            : emailError ==
                                    EmailValidationError.invalidCredentials
                                ? 'غير مظبوط'
                                : emailError ==
                                        EmailValidationError.invalidFormat
                                    ? 'غير مظبوط'
                                    : emailError ==
                                            EmailValidationError
                                                .alreadyRegistered
                                        ? 'هذا البريد موجود مسبقا'
                                        : null,
                      ),
                    ),
                    VerticalGap.large(),
                    TextField(
                      style: const TextStyle(
                        color:
                            Colors.black, // Sets the input text color to white
                      ),
                      onChanged: (text) {
                        cubit.onUserNameChanged(text);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Spacing.small,
                          vertical: Spacing.small,
                        ),
                        hintStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        isDense: true,
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 0,
                        ),
                        prefixIcon: const Icon(
                          Icons.supervised_user_circle,
                          color: Colors.black,
                        ),
                        hintText: 'اسم المستخدم',
                        errorText:
                            userNameError == UserNameValidationError.empty
                                ? 'مطلوب'
                                : null,
                      ),
                    ),
                    VerticalGap.large(),
                    TextField(
                      onChanged: (text) {
                        cubit.onPasswordChanged(text);
                      },
                      style: const TextStyle(
                        color:
                            Colors.black, // Sets the input text color to white
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Spacing.small,
                          vertical: Spacing.small,
                        ),
                        hintStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        isDense: true,
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 0,
                        ),
                        prefixIcon: const Icon(
                          Icons.password_outlined,
                          color: Colors.black,
                        ),
                        hintText: '  كلمة السر',
                        errorText:
                            passwordError == PasswordValidationError.empty
                                ? 'مطلوب'
                                : passwordError == PasswordValidationError.weak
                                    ? 'كلمة السر ضعيفة'
                                    : null,
                      ),
                    ),
                    VerticalGap.large(),
                    TextField(
                      onChanged: (text) {
                        cubit.onPasswordConfirmationChanged(text);
                      },
                      style: const TextStyle(
                        color:
                            Colors.white, // Sets the input text color to white
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Spacing.small,
                          vertical: Spacing.small,
                        ),
                        hintStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        isDense: true,
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 0,
                        ),
                        prefixIcon: const Icon(
                          Icons.password_outlined,
                          color: Colors.black,
                        ),
                        hintText: 'تأكيد كلمة السر ',
                        errorText: passwordConfirmationError ==
                                PasswordConfirmationValidationError.empty
                            ? 'مطلوب'
                            : passwordConfirmationError ==
                                    PasswordConfirmationValidationError
                                        .doesNotMatch
                                ? 'غير مطابق'
                                : null,
                      ),
                    ),
                    VerticalGap.large(),
                    subInProg
                        ? MiraElevatedButton.inProgress(label: '')
                        : MiraElevatedButton(
                            label: 'تسجيل دخول',
                            onTap: () {
                              cubit.onSubmit();
                            }),
                    VerticalGap.large(),
                    TextButton(
                      onPressed: onSignInTap,
                      child: Text('إنشاء حساب',
                          style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MiraAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MiraAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MiraTheme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Image.asset('assets/logo.png'),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
