import 'package:get/get.dart';
import '../controllers/campaign_detail_controller.dart';
import '../services/campaign_detail_service.dart';

class CampaignDetailBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize services first
    Get.lazyPut<CampaignDetailService>(
      () => CampaignDetailService(),
      fenix: true,
    );

    // Initialize controllers
    Get.lazyPut<CampaignDetailController>(
      () => CampaignDetailController(),
    );
  }
}
