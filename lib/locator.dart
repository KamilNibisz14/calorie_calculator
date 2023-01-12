import 'package:get_it/get_it.dart';

import 'features/calculate_day_calories/data/get_calorie_data_from_storage.dart';
import 'features/fill_user_data/data/get_user_data_from_storage.dart';
import 'features/fill_user_data/data/save_user_calorie_data.dart';
import 'features/fill_user_data/data/save_user_data.dart';
import 'features/get_access/data/check_if_user_is_correct.dart';
import 'features/get_access/data/user_access_data_storage.dart';
import 'features/get_access/data/register_new_user.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<CheckLogin>(() => CheckLogin());
  locator.registerLazySingleton<RegisterUser>(() => RegisterUser());
  locator.registerLazySingleton<UserAccessDataStorage>(() => UserAccessDataStorage());
  locator.registerLazySingleton<SaveUserCalorieData>(() => SaveUserCalorieData());
  locator.registerLazySingleton<SaveUserData>(() => SaveUserData());
  locator.registerLazySingleton<GetUserDataFromStorage>(() => GetUserDataFromStorage());
  locator.registerLazySingleton<GetCalorieData>(() => GetCalorieData());
}