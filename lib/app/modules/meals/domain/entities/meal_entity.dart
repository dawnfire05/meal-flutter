abstract class MealEntity {
  final List<String> breakfast;
  final List<String>? breakfastCorner;
  final List<String> lunch;
  final List<String>? lunchCorner;
  final List<String> dinner;
  final List<String>? lunchRenaissance;

  MealEntity({
    required this.breakfast,
    required this.breakfastCorner,
    required this.lunch,
    required this.lunchCorner,
    required this.dinner,
    required this.lunchRenaissance,
  });
}
