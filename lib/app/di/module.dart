import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:meal/app/modules/setting/domain/repositories/language_setting_repository.dart';
import 'package:meal/app/modules/setting/data/repositories/hive_setting_repository.dart';

@module
abstract class AppModule {
  @singleton
  Dio getDio() =>
      Dio(BaseOptions(baseUrl: 'https://api.legacy.meal.gistory.me'));

  @singleton
  LanguageSettingRepository getLanguageSettingRepository(
          HiveSettingRepository r) =>
      r;
}
