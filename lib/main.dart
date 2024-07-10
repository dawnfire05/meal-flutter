import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:meal/app/app.dart';
import 'package:meal/di/locator.dart';
import 'package:meal/gen/strings.g.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _initLocale();
  await HomeWidget.setAppGroupId('group.me.gistory.meal');
  configureDependencies();
  FlutterNativeSplash.remove();
  runApp(const App());
}

Future<void> _initLocale() async {
  await initializeDateFormatting();
  final locale = LocaleSettings.useDeviceLocale();
  Intl.defaultLocale = locale.languageCode;
}
