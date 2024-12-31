import 'package:get/get.dart';
import 'base_api_service.dart';

class ProfileService extends GetxService {
  final BaseApiService _apiService = Get.find();

  Future<Map<String, dynamic>> getProfile(String userId) async {
    try {
      final response = await _apiService.get('/api/userProfile/$userId');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateProfile(
      Map<String, dynamic> profileData) async {
    try {
      final response = await _apiService.put('/api/profile', data: profileData);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
