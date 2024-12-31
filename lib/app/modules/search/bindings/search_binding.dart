import 'package:get/get.dart';
import '../controllers/campaign_controller.dart';
import '../services/campaign_service.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize services first
    Get.lazyPut<CampaignService>(
      () => CampaignService(),
      fenix: true, // Keep the instance alive throughout the app lifecycle
    );

    // Initialize controllers
    Get.lazyPut<CampaignController>(
      () => CampaignController(),
      fenix: true,
    );
  }
}
