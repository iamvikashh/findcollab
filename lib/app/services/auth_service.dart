import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'base_api_service.dart';
import 'storage_service.dart';

class AuthService extends GetxService {
  final BaseApiService _apiService = Get.find();
  final StorageService _storageService = Get.find();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final formData = dio.FormData.fromMap({
        'email': email,
        'password': password,
      });

      final response = await _apiService.post('/api/login', data: formData);
      if (response.data['token'] != null) {
        await _storageService.setToken(response.data['token']);
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> signup(Map<String, dynamic> userData) async {
    try {
      final response = await _apiService.post('/api/signup', data: userData);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _apiService.post('/api/logout');
      await _storageService.removeToken();
    } catch (e) {
      rethrow;
    }
  }
}
