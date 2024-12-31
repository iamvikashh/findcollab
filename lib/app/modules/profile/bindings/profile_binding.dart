import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../../../services/profile_service.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileService());
    Get.lazyPut(() => ProfileController());
  }
}
