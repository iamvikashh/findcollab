import 'package:get/get.dart';
import 'services/base_api_service.dart';
import 'services/auth_service.dart';
import 'services/profile_service.dart';
import 'services/search_service.dart';
import 'services/storage_service.dart';

class InitDependencies implements Bindings {
  @override
  void dependencies() {
    // Core services
    Get.put(BaseApiService(), permanent: true);
    
    // Feature services
    Get.put(AuthService(), permanent: true);
    Get.put(ProfileService(), permanent: true);
    Get.put(SearchService(), permanent: true);
    
    // Add this line before other services
    Get.put(StorageService(), permanent: true);
  }
} 