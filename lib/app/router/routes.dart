library routes;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal/app/modules/meals/presentation/pages/meal_page.dart';
import 'package:meal/app/modules/setting/presentation/pages/setting_page.dart';

part 'routes.g.dart';
part 'meal_routes.dart';
part 'setting_routes.dart';

abstract class AppRoutes {
  static final config = GoRouter(
    initialLocation: const MealRoute().location,
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
  );
}
