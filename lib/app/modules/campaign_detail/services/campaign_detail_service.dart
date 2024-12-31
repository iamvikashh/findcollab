import 'package:get/get.dart';
import '../../../services/base_api_service.dart';
import '../models/campaign_detail_model.dart';

class CampaignDetailService extends GetxService {
  final BaseApiService _apiService = Get.find();

  Future<CampaignDetailResponse> fetchCampaignDetail(String campaignId) async {
    try {
      final response = await _apiService.get(
        '/api/campaignDetail/$campaignId',
      );

      return CampaignDetailResponse.fromJson(response.data);
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
    return ApiException(500, 'Failed to fetch campaign details');
  }
}
