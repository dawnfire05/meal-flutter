import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meal/app/router/routes.dart';
import 'package:meal/gen/strings.g.dart';
import 'package:meal/palette.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Palette.dark,
          ),
        ),
      ),
      routerConfig: AppRoutes.config,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
