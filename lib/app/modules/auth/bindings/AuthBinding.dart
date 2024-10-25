import 'package:ecommerce_app/app/modules/auth/controllers/SignupController.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
