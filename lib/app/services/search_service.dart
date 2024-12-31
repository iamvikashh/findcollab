import 'package:get/get.dart';
import 'base_api_service.dart';

class SearchService extends GetxService {
  final BaseApiService _apiService = Get.find();

  Future<List<Map<String, dynamic>>> search(String query, {Map<String, dynamic>? filters}) async {
    try {
      final response = await _apiService.get(
        '/api/search',
        queryParameters: {
          'q': query,
          if (filters != null) ...filters,
        },
      );
      return List<Map<String, dynamic>>.from(response.data['results']);
    } catch (e) {
      rethrow;
    }
  }
} 