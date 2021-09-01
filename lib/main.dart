import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:labadaph2_mobile/login/login_signup_page.dart';
import 'package:labadaph2_mobile/routes.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'common/appstate_notifier.dart';
import 'common/environment_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EnvironmentConfig.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<AppStateNotifier>(
          create: (context) => AppStateNotifier()),
    ], child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return MultiProvider(
          providers: [
            Provider<FirebaseAnalytics>.value(value: analytics),
            Provider<FirebaseAnalyticsObserver>.value(value: observer),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Labada.ph',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: LoginSignupPage(),
            onGenerateRoute: Routes.onGenerateRoute,
            themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            navigatorObservers: <NavigatorObserver>[observer],
          ),
        );
      },
    );
  }
}
