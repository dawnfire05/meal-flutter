part of 'routes.dart';

@TypedShellRoute<MealShellRoute>(
    routes: [TypedGoRoute<MealRoute>(path: '/meals')])
class MealShellRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return navigator;
  }
}

class MealRoute extends GoRouteData {
  const MealRoute();
  @override
  Widget build(context, state) => const MealPage();
}
