import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appwrite登录'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(labelText: '邮箱'),
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(labelText: '密码'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: controller.login,
                child: const Text('登录'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
