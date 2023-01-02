import 'package:get_it/get_it.dart';

import 'features/get_access/data/check_if_user_is_correct.dart';
import 'features/get_access/data/register_new_user.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<CheckLogin>(() => CheckLogin());
  locator.registerLazySingleton<RegisterUser>(() => RegisterUser());
}