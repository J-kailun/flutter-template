import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controllers/user_controller.dart';

class MineView extends StatelessWidget {
  const MineView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (userController.isLoggedIn.value && userController.user.value != null) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(userController.user.value!.avatar ?? 'https://via.placeholder.com/100'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userController.user.value!.name ?? '用户',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              userController.user.value!.email ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {
                          Get.toNamed('/settings');
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: const NetworkImage('https://via.placeholder.com/100'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '未登录',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '登录后享受更多服务',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/login');
                        },
                        child: const Text('登录'),
                      ),
                    ],
                  ),
                );
              }
            }),
            const SizedBox(height: 24),

            Text(
              '我的订单',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/orders?status=all');
                    },
                    child: Column(
                      children: [
                        Icon(Icons.shopping_cart, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 8),
                        Text('全部订单'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/orders?status=pending');
                    },
                    child: Column(
                      children: [
                        Icon(Icons.pending, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 8),
                        Text('待付款'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/orders?status=shipping');
                    },
                    child: Column(
                      children: [
                        Icon(Icons.local_shipping, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 8),
                        Text('待发货'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/orders?status=delivered');
                    },
                    child: Column(
                      children: [
                        Icon(Icons.delivery_dining, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 8),
                        Text('待收货'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/orders?status=review');
                    },
                    child: Column(
                      children: [
                        Icon(Icons.rate_review, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 8),
                        Text('待评价'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Text(
              '我的服务',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary),
                    title: const Text('地址管理'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.toNamed('/address');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.help_outline, color: Theme.of(context).colorScheme.primary),
                    title: const Text('帮助中心'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.toNamed('/help');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
                    title: const Text('设置'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Obx(() {
              if (userController.isLoggedIn.value) {
                return ElevatedButton(
                  onPressed: () {
                    userController.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text('退出登录'),
                );
              } else {
                return Container();
              }
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
