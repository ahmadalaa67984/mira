import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mira/packages/component_library/component_library.dart';
import 'package:mira/packages/features/sign_in/sign_in_cubit.dart';
import 'package:mira/packages/form_fields/form_fields.dart';
import 'package:mira/packages/user_repository/user_repository.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
    required this.userRepository,
    required this.onSignUpTap,
    required this.onSignInSuccess,

  });

  final UserRepository userRepository;
  final VoidCallback onSignUpTap;
  final VoidCallback onSignInSuccess;


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<SignInCubit>(
      create: (_) => SignInCubit(
        userRepository: widget.userRepository,
        onSignInSuccess: widget.onSignInSuccess,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus,
        child:  SignInView(onSignUpTap:widget.onSignUpTap, ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SignInView extends StatelessWidget {
  const SignInView({
    super.key,
    required this.onSignUpTap,

  });
  final VoidCallback onSignUpTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context,state){
        final cubit = context.read<SignInCubit>();
        if(state.submissionStatus == FormzSubmissionStatus.success){
          cubit.onSignInSuccess();
        }
      },
      builder: (context, state) {
        final theme = MiraTheme.of(context);
        final textTheme = Theme.of(context).textTheme;
        // final textTheme = Theme.of(context).textTheme;
        final subInProg =
            state.submissionStatus == FormzSubmissionStatus.inProgress;
        final cubit = context.read<SignInCubit>();
        final emailError = state.email.isNotValid ? state.email.error : null;

        return Scaffold(
          appBar: const MiraAppBar(),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: theme.screenMargin,
                vertical: Spacing.large,
              ),
              children: [
                Center(
                  child: Text('تسجيل الدخول',
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      )),
                ),
                VerticalGap.large(),
                TextField(
                  onChanged: (text) {
                    cubit.onEmailChanged(text);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: Spacing.small,
                      vertical: Spacing.small,
                    ),
                    isDense: true,
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 0,
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    hintText: 'ايميل',
                    errorText: emailError == EmailValidationError.empty
                        ? 'مطلوب'
                        : emailError == EmailValidationError.invalidCredentials
                            ? 'غير مظبوط'
                            : emailError == EmailValidationError.invalidFormat
                                ? 'غير مظبوط'
                                : null,
                  ),
                ),
                VerticalGap.large(),
                const TextField(),
                VerticalGap.large(),
                subInProg
                    ? MiraElevatedButton.inProgress(label: '')
                    : MiraElevatedButton(label: 'تسجيل دخول', onTap: () {cubit.onSubmit();}),
                GestureDetector(
                  onTap: onSignUpTap,
                  child: Text('إنشاء حساب',style: textTheme.bodyLarge?.copyWith(fontWeight:FontWeight.w500,),),
                )
              ],
            ),
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
      title: Image.asset('assets/logo.png')
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
