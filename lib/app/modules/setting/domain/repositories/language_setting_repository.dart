import 'package:meal/gen/strings.g.dart';

abstract class LanguageSettingRepository {
  Future<AppLocale> getLanguage();
  Future<void> setLanguage(AppLocale language);
}
