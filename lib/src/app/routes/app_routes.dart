import 'package:get/get.dart';
import '../pages/main/main_view.dart';
import '../pages/main/main_binding.dart';
import '../pages/home/home_view.dart';
import '../pages/home/home_binding.dart';
import '../pages/mall/mall_view.dart';
import '../pages/mall/mall_binding.dart';
import '../pages/mine/mine_view.dart';
import '../pages/mine/mine_binding.dart';
import '../pages/login/login_view.dart';
import '../pages/login/login_binding.dart';
import '../pages/register/register_view.dart';
import '../pages/register/register_binding.dart';
import '../pages/placeholder_pages.dart';
import 'auth_middleware.dart';

class AppRoutes {
  static const String splash = '/';
  static const String main = '/main';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String mall = '/mall';
  static const String mine = '/mine';
  static const String checkout = '/checkout';
  static const String search = '/search';
  static const String products = '/products';
  static const String productDetail = '/product/:id';
  static const String categories = '/categories';
  static const String categoryDetail = '/category/:id';
  static const String orders = '/orders';
  static const String address = '/address';
  static const String settings = '/settings';
  static const String help = '/help';
  static const String forgotPassword = '/forgot-password';
  static const String terms = '/terms';
  static const String privacy = '/privacy';

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: main,
      page: () => const MainView(),
      binding: MainBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: mall,
      page: () => const MallView(),
      binding: MallBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: mine,
      page: () => const MineView(),
      binding: MineBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: checkout,
      page: () => const CheckoutPage(),
      transition: Transition.rightToLeft,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: search,
      page: () => const SearchPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: products,
      page: () => const ProductsPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: productDetail,
      page: () => const ProductDetailPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: categories,
      page: () => const CategoriesPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: categoryDetail,
      page: () => const CategoryDetailPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: orders,
      page: () => const OrdersPage(),
      transition: Transition.rightToLeft,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: address,
      page: () => const AddressPage(),
      transition: Transition.rightToLeft,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: settings,
      page: () => const SettingsPage(),
      transition: Transition.rightToLeft,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: help,
      page: () => const HelpPage(),
      transition: Transition.rightToLeft,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPasswordPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: terms,
      page: () => const TermsPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: privacy,
      page: () => const PrivacyPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
