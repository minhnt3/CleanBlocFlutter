import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'di/web_app_module.dart';
import 'routes/app_routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Base Clean Flutter',
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      initialRoute: AppRoutes.login,
      initialBinding: WebAppModule(),
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (deviceLocale != null && supportedLocales.contains(deviceLocale)) {
          return deviceLocale;
        } else {
          return const Locale('en', 'US');
        }
      },
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
