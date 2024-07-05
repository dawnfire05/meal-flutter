import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meal/api/models/meal_model.dart';
import 'package:retrofit/retrofit.dart';

part 'meal_api.g.dart';

@singleton
@RestApi(baseUrl: '/meals')
abstract class MealApi {
  @factoryMethod
  factory MealApi(Dio dio) = _MealApi;

  @GET('/date/{year}/{month}/{day}/{restaurant}/{language}')
  Future<MealModel> getMeal(
    @Path() int year,
    @Path() int month,
    @Path() int day,
    @Path() String restaurant,
    @Path() String language,
  );
}
