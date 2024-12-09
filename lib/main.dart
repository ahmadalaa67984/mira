import 'package:mira/packages/component_library/l10n/component_library_localizations.dart';
import 'package:mira/packages/component_library/snack_bars/internet_error_snack_bar.dart';
import 'package:mira/packages/component_library/snack_bars/show_snack_bar.dart';
import 'package:mira/packages/key_value_storage/key_value_storage.dart';
import 'package:mira/packages/mira_api/mira_api.dart';
import 'package:mira/packages/mira_api/models/exceptions.dart';
import 'package:mira/packages/user_repository/user_repository.dart';
import 'package:mira/routing_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:routemaster/routemaster.dart';

import 'packages/component_library/theme/theme.dart';

String? fontFamily;

final ValueNotifier<bool> _isUserUnAuthSC = ValueNotifier(false);
final ValueNotifier<InternetConnectionMiraException?>
    _internetConnectionErrorVN = ValueNotifier(null);
final ValueNotifier<bool> _signInSuccessVN = ValueNotifier(false);

final dynamic _miraApi = MiraApi(
  // userSlugSupplier: () => _userRepository.getUserSlug(),
  userTokenSupplier: () => _userRepository.getUserToken(),
  isUserUnAuthenticatedVN: _isUserUnAuthSC,
  internetConnectionErrorVN: _internetConnectionErrorVN,
);

final _userRepository = UserRepository(
  remoteApi: _miraApi,
  noSqlStorage: _keyValueStorage,
);

final _keyValueStorage = KeyValueStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(
    const Mira(),
  );
}

class Mira extends StatefulWidget {
  const Mira({
    super.key,
  });

  @override
  MiraState createState() => MiraState();
}

class MiraState extends State<Mira> with WidgetsBindingObserver {
  Brightness? _appBrightness;

  @override
  void initState() {
    super.initState();
    _userRepository.getUser().first.then((user) {
      _signInSuccessVN.value = user?.name != null;
    });

    WidgetsBinding.instance.addObserver(this);
    // This is used to fetch the user path from the user repository secure storage
    // and set the url with it
  }

  // This callback is invoked every time the platform brightness changes.
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    // Get the brightness.
    setState(() {
      _appBrightness = View.of(context).platformDispatcher.platformBrightness;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  late final dynamic _routerDelegate = RoutemasterDelegate(
    routesBuilder: (context) {
      return RouteMap(
        routes: buildRoutingTable(
            routerDelegate: _routerDelegate, userRepository: _userRepository,miraApi:_miraApi),
      );
    },
  );
  final _lightTheme = LightMiraThemeData();
  final _darkTheme = DarkMiraThemeData();

  @override
  Widget build(BuildContext context) {
    return MiraTheme(
      context: context,
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: AnnotatedRegion(
        // To control the system nav bar when it is changed
        // and when the widget first initializes
        value: _appBrightness == Brightness.dark ||
                SchedulerBinding
                        .instance.platformDispatcher.platformBrightness ==
                    Brightness.dark
            ? SystemUiOverlayStyle.light.copyWith(
                systemNavigationBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Colors.black,
              )
            : SystemUiOverlayStyle.light.copyWith(
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.white,
              ),
        child: MaterialApp.router(
          theme: _lightTheme.materialThemeData.copyWith(
            textTheme: _lightTheme.materialThemeData.textTheme.apply(
              fontFamily: 'Tajawal',
            ),
          ),
          darkTheme: _darkTheme.materialThemeData.copyWith(
            textTheme: _darkTheme.materialThemeData.textTheme.apply(
              fontFamily: 'Tajawal',
            ),
          ),
          themeMode: ThemeMode.light,
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: InternetErrorIndicator(
                child: child!,
              ),
            );
          },
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            // Global Localizations
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            ComponentLibraryLocalizations.delegate,
          ],
          routerDelegate: _routerDelegate,
          routeInformationParser: const RoutemasterParser(),
        ),
      ),
    );
  }
}

class InternetErrorIndicator extends StatefulWidget {
  const InternetErrorIndicator({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<InternetErrorIndicator> createState() => _InternetErrorIndicatorState();
}

class _InternetErrorIndicatorState extends State<InternetErrorIndicator> {
  @override
  void initState() {
    super.initState();
    _internetConnectionErrorVN.addListener(
      () {
        if (_internetConnectionErrorVN.value != null) {
          showSnackBar(
            context: context,
            snackBar: const InternetErrorSnackBar(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
