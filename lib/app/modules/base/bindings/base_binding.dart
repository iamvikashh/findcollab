import 'package:ecommerce_app/app/modules/chat/controller/chat_controller.dart';
import 'package:get/get.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../favorites/controllers/favorites_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../notifications/controllers/notifications_controller.dart';
import '../../search/controllers/campaign_controller.dart';
import '../../search/services/campaign_service.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<SettingsController>(() => SettingsController());
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
