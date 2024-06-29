import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:meal/app/app.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  Intl.defaultLocale = widgetsBinding.platformDispatcher.locale.languageCode;
  await HomeWidget.setAppGroupId('group.me.gistory.meal');
  runApp(const App());
}
