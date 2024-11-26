
import 'package:mira/tab_container_screen.dart';
import 'package:flutter/material.dart';
import 'package:menu/menu.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sign_in/sign_in.dart';
import 'package:sign_up/sign_up.dart';
import 'package:task/task.dart';

import 'package:user_repository/user_repository.dart';

final ValueNotifier<bool> _shouldPassInitialAuthentication = ValueNotifier(false);

Map<String, PageBuilder> buildRoutingTable({
  required RoutemasterDelegate routerDelegate,
  required UserRepository userRepository,

}) {
  userRepository.getUser().first.then(
        (user) {
      // If there is a cached user it means he has boarded once already
      _shouldPassInitialAuthentication.value = user != null;
    },
  );
  userRepository.signInSuccessVN.addListener(
      ()=>print('hjgjjfh ${userRepository.signInSuccessVN}')
  );
  routerDelegate.addListener((){
    print(routerDelegate.currentConfiguration!.fullPath);
  });
  return {
    _PathConstants.tabContainerPath: (_) => CupertinoTabPage(
      backBehavior: TabBackBehavior.history,
      paths: [
        _PathConstants.tasksPath,
        _PathConstants.menuPath,
      ],
      child: ValueListenableBuilder<bool?>(
        valueListenable: userRepository.signInSuccessVN,
        builder: (context, signInSuccess, __) {
          return signInSuccess == true
              ? const TabContainerScreen()
              : SignInScreen(
            userRepository: userRepository,
              onSignInSuccess:(){
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
            // onContactsTapped: () =>
            //     routerDelegate.push(_PathConstants.contactsPath),
            // onCompaniesTapped: () =>
            //     routerDelegate.push(_PathConstants.companiesPath),
            // onDealsTapped: () => routerDelegate.push(_PathConstants.dealsPath),
            // onTasksTapped: () => routerDelegate.push(_PathConstants.tasksPath),
            // onAppUsersTapped: () =>
            //     routerDelegate.push(_PathConstants.appUsersPath),
            // onGeneralSettingsTapped: () =>
            //     routerDelegate.push(_PathConstants.generalSettingsPath),
            // onNotificationSettingsTapped: () =>
            //     routerDelegate.push(_PathConstants.notificationSettingsPath),
            // onLogOutTapped: () => signInSuccessVN.value = false,
          ),
        ),
    // _PathConstants.signInPath: (_) => MaterialPage(
    //   name: 'sign-in',
    //   child: Builder(builder: (context) {
    //     return SignInScreen(
    //       userRepository: userRepository,
    //       // onForgotPasswordTapped: () => showModalBottomSheet(
    //       //   context: context,
    //       //   isScrollControlled: true,
    //       //   showDragHandle: true,
    //       //   enableDrag: true,
    //       //   builder: (_) => SendOtpBottomSheet(
    //       //     userRepository: userRepository,
    //       //     onSendOtpSuccess: () {
    //       //       routerDelegate.pop();
    //       //       routerDelegate.push(_PathConstants.verifyOtpPath);
    //       //     },
    //       //   ),
    //       // ),
    //       // onSignInSuccess: () async {
    //       //   await routerDelegate.popRoute();
    //       //   _shouldPassInitialAuthentication.value = true;
    //       // },
    //       onSignUpTap: () {
    //         routerDelegate.push(_PathConstants.signUpPath);
    //       },
    //       // onOtpSent: () =>
    //       //     routerDelegate.push(_PathConstants.verifyOtpPath),
    //     );
    //   }),
    // ),
    _PathConstants.signUpPath: (_) => MaterialPage(
      name: 'sign-up',
      child: SignUpScreen(
        userRepository: userRepository,
        onSignInTap: () => routerDelegate
            .popRoute()
            .then((_) => routerDelegate.push(_PathConstants.signInPath)),
        onSignUpSuccess:()async{
          await routerDelegate.popRoute()
              .then((_) => routerDelegate.push(_PathConstants.tasksPath));
          userRepository.signInSuccessVN.value = true;
        },
        // onSignUpSuccess: () async {
        //   await routerDelegate.popRoute();
        //   if (routerDelegate.history.canGoBack) {
        //     await routerDelegate.popRoute();
        //   }
        //   routerDelegate.push(_PathConstants.verifyOtpPath);
        // },
      ),
    ),
    _PathConstants.tasksPath: (_) => MaterialPage(
      name: 'task',
      child: TasksScreen(
        userRepository: userRepository,
        // onSignInTap: () => routerDelegate
        //     .popRoute()
        //     .then((_) => routerDelegate.push(_PathConstants.tasksPath)),
        // // onSignUpSuccess: () async {
        // //   await routerDelegate.popRoute();
        // //   if (routerDelegate.history.canGoBack) {
        // //     await routerDelegate.popRoute();
        // //   }
        // //   routerDelegate.push(_PathConstants.verifyOtpPath);
        // // },
      ),
    ),

  };

}

class _PathConstants {
  const _PathConstants._();

  // General Paths
  static String get idParameter => 'id';

  static String get tabContainerPath => '/';
  //auth Paths
  static String get signInPath => '${tabContainerPath}sign-in';
  static String get signUpPath => '${tabContainerPath}sign-up';


  // Task Paths
  static String get tasksPath => '${tabContainerPath}task';

  static String get tasksCalendarPath => '$tasksPath/calendar';

  static String taskDetailsPath({int? taskId}) =>
      '${tabContainerPath}task/${taskId ?? ':$idParameter'}';

  // Contact Paths
  static String get contactsPath => '${tabContainerPath}contacts';


  static String contactDetailsPath({int? contactId}) =>
      '${tabContainerPath}contact/${contactId ?? ':$idParameter'}';

  static String get contactsTablePath => '$contactsPath/table';

  // Deal Paths
  static String get dealsPath => '${tabContainerPath}deals';

  static String dealDetailsPath({int? dealId}) =>
      '${tabContainerPath}deal/${dealId ?? ':$idParameter'}';

  static String get dealsTablePath => '$dealsPath/table';

  // Companies Paths
  static String get companiesPath => '${tabContainerPath}companies';

  static String companyDetailsPath({int? companyId}) =>
      '${tabContainerPath}company/${companyId ?? ':$idParameter'}';

  static String get companiesTablePath => '$companiesPath/table';

  // Dashboard Paths
  static String get dashboardPath => '${tabContainerPath}dashboard';

  // Menu Paths
  static String get menuPath => '${tabContainerPath}menu';

  static String get generalSettingsPath => '$menuPath/general-settings';

  static String get appUsersPath => '$menuPath/app-users';

  static String get notificationSettingsPath =>
      '$menuPath/notification-settings';
}
