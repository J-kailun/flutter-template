import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_view.dart';
import '../mall/mall_view.dart';
import '../mine/mine_view.dart';
import 'main_logic.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MainLogic>();
    final state = logic.state;

    return Scaffold(
      body: Obx(() {
        switch (state.currentIndex.value) {
          case 0:
            return HomeView();
          case 1:
            return MallView();
          case 2:
            return MineView();
          default:
            return HomeView();
        }
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: state.currentIndex.value,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: '商城',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
        onTap: (index) {
          logic.changePage(index);
        },
      )),
    );
  }
}
