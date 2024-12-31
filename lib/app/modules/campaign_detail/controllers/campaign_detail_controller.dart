import 'package:get/get.dart';
import '../../../services/base_api_service.dart';
import '../models/campaign_detail_model.dart';
import '../services/campaign_detail_service.dart';

class CampaignDetailController extends GetxController {
  final CampaignDetailService _campaignDetailService = Get.find();

  final campaignDetail = Rxn<CampaignDetail>();
  final isLoading = false.obs;
  final error = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    final String? campaignId = Get.arguments?['campaignId'];
    if (campaignId != null) {
      fetchCampaignDetail(campaignId);
    }
  }

  Future<void> fetchCampaignDetail(String campaignId) async {
    try {
      isLoading.value = true;
      error.value = null;

      final response =
          await _campaignDetailService.fetchCampaignDetail(campaignId);
      campaignDetail.value = response.campaign;
    } catch (e) {
      String errorMessage = 'Failed to load campaign details';

      if (e is TimeoutException) {
        errorMessage = 'Connection timeout. Please try again.';
      } else if (e is ApiException) {
        errorMessage = e.message;
      }

      error.value = errorMessage;
      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void onApplyTap() {
    // Handle apply button tap
    // You can implement the apply functionality here
  }

  void onShareTap() {
    // Handle share button tap
    // You can implement the share functionality here
  }
}
