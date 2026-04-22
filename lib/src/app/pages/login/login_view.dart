import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_logic.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogic>();
    final state = logic.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Icon(
                Icons.shopping_bag,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                '欢迎回来',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '登录以继续购物',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Obx(() => TextField(
                onChanged: logic.setEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: '邮箱',
                  prefixIcon: const Icon(Icons.email),
                  border: const OutlineInputBorder(),
                  errorText: state.error.value.contains('邮箱') ? state.error.value : null,
                ),
              )),
              const SizedBox(height: 16),
              Obx(() => TextField(
                onChanged: logic.setPassword,
                obscureText: !state.isPasswordVisible.value,
                decoration: InputDecoration(
                  labelText: '密码',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: logic.togglePasswordVisibility,
                  ),
                  border: const OutlineInputBorder(),
                  errorText: state.error.value.contains('密码') ? state.error.value : null,
                ),
              )),
              const SizedBox(height: 16),
              Obx(() => Row(
                children: [
                  Checkbox(
                    value: state.rememberMe.value,
                    onChanged: (_) => logic.toggleRememberMe(),
                  ),
                  const Text('记住我'),
                  const Spacer(),
                  TextButton(
                    onPressed: logic.goToForgotPassword,
                    child: const Text('忘记密码？'),
                  ),
                ],
              )),
              const SizedBox(height: 24),
              Obx(() => ElevatedButton(
                onPressed: state.isLoading.value ? null : logic.login,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: state.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text('登录'),
              )),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '还没有账号？',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  TextButton(
                    onPressed: logic.goToRegister,
                    child: const Text('立即注册'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              Text(
                '或使用以下方式登录',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialLoginButton(
                    context,
                    icon: Icons.phone,
                    label: '手机号',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  _buildSocialLoginButton(
                    context,
                    icon: Icons.wechat,
                    label: '微信',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
