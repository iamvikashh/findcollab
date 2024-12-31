import 'package:get/get.dart';
import '../../../services/base_api_service.dart';
import '../models/campaign_model.dart';
import '../services/campaign_service.dart';

class CampaignController extends GetxController {
  final CampaignService _campaignService = Get.find();

  var campaigns = <Campaign>[].obs;
  var filteredCampaigns = <Campaign>[].obs;
  var searchQuery = ''.obs;
  var isLoading = false.obs;
  var currentPage = 1.obs;
  var hasMoreData = true.obs;
  var totalRecords = 0.obs;
  var error = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    fetchCampaigns();
  }

  Future<void> fetchCampaigns({bool refresh = false}) async {
    if (refresh) {
      currentPage.value = 1;
      campaigns.clear();
      hasMoreData.value = true;
      error.value = null;
    }

    if (!hasMoreData.value || isLoading.value) return;

    try {
      isLoading.value = true;
      error.value = null;

      final response =
          await _campaignService.fetchCampaigns(page: currentPage.value);

      if (response.result.isEmpty) {
        hasMoreData.value = false;
      } else {
        campaigns.addAll(response.result);
        totalRecords.value = response.totalRecord;
        currentPage.value++;
      }

      search(searchQuery.value);
    } catch (e) {
      String errorMessage = 'Failed to load campaigns';

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

  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredCampaigns.value = campaigns;
    } else {
      filteredCampaigns.value = campaigns
          .where((campaign) =>
              campaign.projectTitle
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              campaign.briefs.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  Future<void> refreshCampaigns() async {
    await fetchCampaigns(refresh: true);
  }
}
