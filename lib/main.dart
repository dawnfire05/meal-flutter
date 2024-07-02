import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:meal/app/app.dart';
import 'package:meal/gen/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initLocale();
  await HomeWidget.setAppGroupId('group.me.gistory.meal');
  runApp(const App());
}

Future<void> _initLocale() async {
  await initializeDateFormatting();
  final locale = LocaleSettings.useDeviceLocale();
  Intl.defaultLocale = locale.languageCode;
}
