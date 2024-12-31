import 'package:ecommerce_app/app/modules/auth/bindings/AuthBinding.dart';
import 'package:ecommerce_app/app/modules/auth/views/login_view.dart';
import 'package:ecommerce_app/app/modules/auth/views/signup_view.dart';
import 'package:ecommerce_app/app/modules/chat/bindings/chat_binding.dart';
import 'package:ecommerce_app/app/modules/chat/views/chat_page.dart';
import 'package:ecommerce_app/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';

import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/campaign_detail/bindings/campaign_detail_binding.dart';
import '../modules/campaign_detail/views/campaign_detail_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/campaign_search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => MultiStepSignup(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.CAMPAIGN_DETAIL,
      page: () => const CampaignDetailView(),
      binding: CampaignDetailBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => CampaignSearchView(),
      binding: SearchBinding(),
    ),
  ];
}
