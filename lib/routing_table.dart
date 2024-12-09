import 'package:mira/packages/features/home/home_screen.dart';
import 'package:mira/packages/features/menu/menu_screen.dart';
import 'package:mira/packages/features/sign_in/sign_in_screen.dart';
import 'package:mira/packages/features/sign_up/sign_up_screen.dart';
import 'package:mira/packages/mira_api/mira_api.dart';
import 'package:mira/packages/user_repository/user_repository.dart';
import 'package:mira/tab_container_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final ValueNotifier<bool> _shouldPassInitialAuthentication =
    ValueNotifier(false);

Map<String, PageBuilder> buildRoutingTable({
  required RoutemasterDelegate routerDelegate,
  required UserRepository userRepository,
  required MiraApi miraApi,
}) {
  userRepository.getUser().first.then(
    (user) {
      // If there is a cached user it means he has boarded once already
      _shouldPassInitialAuthentication.value = user != null;
    },
  );
  userRepository.signInSuccessVN.addListener(
      () => debugPrint('hjgjjfh ${userRepository.signInSuccessVN}'));
  routerDelegate.addListener(() {
    debugPrint(routerDelegate.currentConfiguration!.fullPath);
  });
  return {
    _PathConstants.tabContainerPath: (_) => CupertinoTabPage(
          backBehavior: TabBackBehavior.history,
          paths: [
            _PathConstants.homePath,
            _PathConstants.menuPath,
          ],
          child: ValueListenableBuilder<bool?>(
            valueListenable: userRepository.signInSuccessVN,
            builder: (context, signInSuccess, __) {
              return true
                  ? const TabContainerScreen()
                  : SignInScreen(
                      userRepository: userRepository,
                      onSignInSuccess: () {
                        userRepository.signInSuccessVN.value = true;
                      },
                      onSignUpTap: () =>
                          routerDelegate.push(_PathConstants.signUpPath),
                    );
            },
          ),
        ),
    // Menu paths
    _PathConstants.menuPath: (routeData) => MaterialPage(
          name: 'menu',
          child: MenuScreen(
            userRepository: userRepository,
          ),
        ),
    _PathConstants.signUpPath: (_) => MaterialPage(
          name: 'sign-up',
          child: SignUpScreen(
            userRepository: userRepository,
            onSignInTap: () => routerDelegate
                .popRoute()
                .then((_) => routerDelegate.push(_PathConstants.signInPath)),
            onSignUpSuccess: () async {
              await routerDelegate
                  .popRoute()
                  .then((_) => routerDelegate.push(_PathConstants.homePath));
              userRepository.signInSuccessVN.value = true;
            },
          ),
        ),
    _PathConstants.homePath: (_) => MaterialPage(
          name: 'home',
          child: HomeScreen(
            userRepository: userRepository,
          ),
        ),
  };
}

class _PathConstants {
  const _PathConstants._();

  static String get tabContainerPath => '/';

  static String get signInPath => '${tabContainerPath}sign-in';

  static String get signUpPath => '${tabContainerPath}sign-up';

  static String get homePath => '${tabContainerPath}home';

  static String get menuPath => '${tabContainerPath}menu';
}
