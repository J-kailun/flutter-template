import 'package:get/get.dart';
import 'main_state.dart';

class MainLogic extends GetxController {
  final state = MainState();


  void changePage(int index) {
    state.currentIndex.value = index;
  }
}
