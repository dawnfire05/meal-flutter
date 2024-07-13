import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:meal/app/app.dart';
import 'package:meal/app/modules/setting/domain/repositories/language_setting_repository.dart';
import 'package:meal/app/di/locator.dart';
import 'package:meal/gen/strings.g.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _initHive();
  await configureDependencies();
  await _initLocale();
  await HomeWidget.setAppGroupId('group.me.gistory.meal');
  FlutterNativeSplash.remove();
  runApp(TranslationProvider(child: const App()));
}

Future<void> _initLocale() async {
  final locale = await sl<LanguageSettingRepository>().getLanguage();
  LocaleSettings.setLocale(locale);
  await initializeDateFormatting();
  Intl.defaultLocale = locale.languageCode;
  LocaleSettings.setPluralResolver(
    locale: AppLocale.ko,
    cardinalResolver: (n, {few, many, one, other, two, zero}) =>
        other ?? n.toString(),
    ordinalResolver: (n, {few, many, one, other, two, zero}) =>
        other ?? n.toString(),
  );
}

Future<void> _initHive() async {
  await Hive.initFlutter();
}
