import 'package:get/get.dart';

class SignupController extends GetxController {
  RxString jsonString = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();  // Load JSON when the controller initializes
  }

  Future<void> loadJsonData() async {
    try {
      // String jsonStringResponse = await localJsonRw.localRead();
      // jsonString.value = await ConfigurationSetting.instance
      //     .storeFormDataLocal(jsonStringResponse);
    } catch (e) {
      // Handle errors here
      print("Error loading JSON data: $e");
    }
  }
}
