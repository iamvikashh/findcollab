import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late final SharedPreferences _prefs;
  static const String _tokenKey = 'auth_token';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getToken() => _prefs.getString(_tokenKey);
  
  Future<void> setToken(String token) => _prefs.setString(_tokenKey, token);
  
  Future<void> removeToken() => _prefs.remove(_tokenKey);
} 