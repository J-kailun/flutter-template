import 'package:get/get.dart';
import 'main_logic.dart';
import '../home/home_logic.dart';
import '../mall/mall_logic.dart';
import '../mine/mine_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLogic>(() => MainLogic());
    Get.lazyPut<HomeLogic>(() => HomeLogic());
    Get.lazyPut<MallLogic>(() => MallLogic());
    Get.lazyPut<MineLogic>(() => MineLogic());
  }
}
