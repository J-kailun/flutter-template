import 'package:get/get.dart';
import 'api_service.dart';
import 'storage_service.dart';
import 'theme_service.dart';
import 'network_service.dart';
import 'navigation_service.dart';
import 'localization_service.dart';
import 'device_info_service.dart';
import '../controllers/user_controller.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';

void setupDependencies() {
  // 基础服务
  Get.put<StorageService>(StorageService());
  Get.put<DeviceInfoService>(DeviceInfoService());
  Get.put<ApiService>(ApiService());
  Get.put<ThemeService>(ThemeService(Get.find()));
  Get.put<NetworkService>(NetworkService());
  Get.put<NavigationService>(NavigationService());
  Get.put<LocalizationService>(LocalizationService());
  
  // 仓库
  Get.put<AuthRepository>(AuthRepositoryImpl(Get.find()));
  
  // 控制器
  Get.put<UserController>(UserController(Get.find(), Get.find()));
}
