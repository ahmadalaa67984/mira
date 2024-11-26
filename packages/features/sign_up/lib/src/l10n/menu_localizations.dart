import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'menu_localizations_ar.dart';
import 'menu_localizations_en.dart';

/// Callers can lookup localized strings with an instance of MenuLocalizations
/// returned by `MenuLocalizations.of(context)`.
///
/// Applications need to include `MenuLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/menu_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: MenuLocalizations.localizationsDelegates,
///   supportedLocales: MenuLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the MenuLocalizations.supportedLocales
/// property.
abstract class MenuLocalizations {
  MenuLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static MenuLocalizations of(BuildContext context) {
    return Localizations.of<MenuLocalizations>(context, MenuLocalizations)!;
  }

  static const LocalizationsDelegate<MenuLocalizations> delegate = _MenuLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @contactUsButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUsButtonLabel;

  /// No description provided for @notificationsButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsButtonLabel;

  /// No description provided for @usersButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get usersButtonLabel;

  /// No description provided for @generalSettingsButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettingsButtonLabel;

  /// No description provided for @tasksButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tasksButtonLabel;

  /// No description provided for @packagesButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Packages'**
  String get packagesButtonLabel;

  /// No description provided for @userGreetingTitle.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get userGreetingTitle;

  /// No description provided for @logoutButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButtonLabel;

  /// No description provided for @dealsButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Deals'**
  String get dealsButtonLabel;

  /// No description provided for @companiesButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get companiesButtonLabel;

  /// No description provided for @inviteUserButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Invite User'**
  String get inviteUserButtonLabel;

  /// No description provided for @contactsButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contactsButtonLabel;
}

class _MenuLocalizationsDelegate extends LocalizationsDelegate<MenuLocalizations> {
  const _MenuLocalizationsDelegate();

  @override
  Future<MenuLocalizations> load(Locale locale) {
    return SynchronousFuture<MenuLocalizations>(lookupMenuLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_MenuLocalizationsDelegate old) => false;
}

MenuLocalizations lookupMenuLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return MenuLocalizationsAr();
    case 'en': return MenuLocalizationsEn();
  }

  throw FlutterError(
    'MenuLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
