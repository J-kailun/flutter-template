import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_logic.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RegisterLogic>();
    final state = logic.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Icon(
                Icons.shopping_bag,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                '创建账号',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '注册以开始购物之旅',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Obx(() => TextField(
                onChanged: logic.setUsername,
                decoration: InputDecoration(
                  labelText: '用户名',
                  prefixIcon: const Icon(Icons.person),
                  border: const OutlineInputBorder(),
                  errorText: state.error.value.contains('用户名') ? state.error.value : null,
                ),
              )),
              const SizedBox(height: 16),
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
              Obx(() => TextField(
                onChanged: logic.setConfirmPassword,
                obscureText: !state.isConfirmPasswordVisible.value,
                decoration: InputDecoration(
                  labelText: '确认密码',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.isConfirmPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: logic.toggleConfirmPasswordVisibility,
                  ),
                  border: const OutlineInputBorder(),
                  errorText: state.error.value.contains('确认') || state.error.value.contains('一致') 
                      ? state.error.value 
                      : null,
                ),
              )),
              const SizedBox(height: 16),
              Obx(() => Row(
                children: [
                  Checkbox(
                    value: state.agreeToTerms.value,
                    onChanged: (_) => logic.toggleAgreeToTerms(),
                  ),
                  Expanded(
                    child: Wrap(
                      children: [
                        const Text('我已阅读并同意'),
                        TextButton(
                          onPressed: logic.goToTerms,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text('用户协议'),
                        ),
                        const Text('和'),
                        TextButton(
                          onPressed: logic.goToPrivacy,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text('隐私政策'),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 24),
              Obx(() => ElevatedButton(
                onPressed: state.isLoading.value ? null : logic.register,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: state.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text('注册'),
              )),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '已有账号？',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  TextButton(
                    onPressed: logic.goToLogin,
                    child: const Text('立即登录'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
