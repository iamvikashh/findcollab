import 'package:get/get.dart';
import '../../../services/base_api_service.dart';
import '../models/campaign_model.dart';

class CampaignService extends GetxService {
  final BaseApiService _apiService = Get.find();

  Future<CampaignResponse> fetchCampaigns({int page = 1}) async {
    try {
      final response = await _apiService.get(
        '/api/campaigns',
        queryParameters: {'page': page},
      );

      return CampaignResponse.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic error) {
    if (error is ApiException) {
      return error;
    }
    if (error is TimeoutException) {
      return error;
    }
    return ApiException(500, 'Failed to fetch campaigns');
  }
}
