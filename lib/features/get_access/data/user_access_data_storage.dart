import 'package:calorie_calculator/features/get_access/domain/entities/user_data.dart';
import 'package:hive/hive.dart';

class UserAccessDataStorage{
  GetAccessUserData getUserAccessData(){
    var box = Hive.box('UserAccessData');
    GetAccessUserData getAccessUserData = GetAccessUserData();
    getAccessUserData.email = box.get("email");
    getAccessUserData.password = box.get("password");
    return getAccessUserData;
  }
  void setUserAccessData(GetAccessUserData getAccessUserData){
    var box = Hive.box('UserAccessData');
    box.put('email',getAccessUserData.email);
    box.put('password', getAccessUserData.password);
  }
  void logout(){
    var box = Hive.box('UserAccessData');
    box.clear();
  }
}