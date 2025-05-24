import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernceUtlis{
  static late SharedPreferences sharedPreferences;
  static init()async{
    sharedPreferences= await SharedPreferences.getInstance();
}
static Future<bool>saveData({required String key,required dynamic value}){
    if(value is int){
      return sharedPreferences.setInt(key, value);
    }
    else if(value is String){
      return sharedPreferences.setString(key, value);
    }
    else if(value is double){
      return sharedPreferences.setDouble(key, value);
    }
    else {
      return sharedPreferences.setBool(key, value);
    }
}
static getData({required String key}){
    return sharedPreferences.get(key);
}
static Future<bool>removeData({required String key}){
    return sharedPreferences.remove(key);
}
}
