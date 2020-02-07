import 'package:shared_preferences/shared_preferences.dart';

class ShareData{

  Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  getData(String key){
      getInstance().then((sp){
        return sp.getString(key);
      });
  }


  setData(String key,dynamic value){
    getInstance().then((sp){
      sp.setString(key, value);
    });
  }

  removeKey(String key){
    getInstance().then((sp){
      sp.remove(key);
    });
  }
}