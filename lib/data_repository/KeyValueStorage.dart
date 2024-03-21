import 'package:shared_preferences/shared_preferences.dart';

class KeyValuesStorage{
  late SharedPreferences _preferences;
  late Future<void> finishInit;

  KeyValuesStorage(){
    finishInit = initialize();
  }

  Future<void> initialize()async{
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key,String value)async{
    await finishInit;
    await _preferences.setString(key, value);
  }

  Future<String?> getString(String key) async{
    await finishInit;
    return _preferences.getString(key);
  }

  Future<void> remove(String key)async{
    await finishInit;
    await _preferences.remove(key);
  }

}