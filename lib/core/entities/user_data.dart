import 'package:calorie_calculator/core/entities/gender_enum.dart';
import 'package:calorie_calculator/core/entities/goal_enum.dart';

class UserData{
  Gender gender;
  Goal goal;
  int age;
  int daysOfExercise;
  double weight;
  int height;
  UserData({
    this.age = 20,
    this.daysOfExercise = 3,
    this.gender = Gender.male,
    this.goal = Goal.Maintain,
    this.height = 175,
    this.weight = 80,
  });
}