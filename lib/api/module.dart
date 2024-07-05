import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  Dio getDio() =>
      Dio(BaseOptions(baseUrl: 'https://api.legacy.meal.gistory.me'));
}
