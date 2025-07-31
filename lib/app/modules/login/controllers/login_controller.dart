import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winnerapp_appwrite_admin/common/functions.dart';
import 'package:winnerapp_appwrite_admin/common/global_server.dart';
import 'package:winnerapp_appwrite_admin/common/shared_preference_key.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    Future.sync(() async {
      final prefs = await SharedPreferences.getInstance();
      final userName = prefs.getString(SharedPreferenceKey.userName.name) ?? '';
      final password = prefs.getString(SharedPreferenceKey.password.name) ?? '';
      if (userName.isNotEmpty && password.isNotEmpty) {
        emailController.text = userName;
        passwordController.text = password;
        login();
      }
    });
  }

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      showError('请输入邮箱和密码');
      return;
    }
    if (await isLogin()) {
      loginSuccess();
    } else {
      SmartDialog.showLoading();
      globalServer.server.account
          .createEmailPasswordSession(email: email, password: password)
          .then(
        (value) {
          SmartDialog.dismiss();
          showSuccess('登录成功');
          loginSuccess();
        },
      ).catchError(
        (error, stackTrace) {
          SmartDialog.dismiss();
          showError(error.message);
          throw error;
        },
      );
    }
  }

  void loginSuccess() {
    saveLoginInfo(emailController.text, passwordController.text);
    Get.offAllNamed('/home');
  }

  void saveLoginInfo(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferenceKey.userName.name, email);
    prefs.setString(SharedPreferenceKey.password.name, password);
    await prefs.commit();
  }

  Future<bool> isLogin() async {
    try {
      await globalServer.server.account.getSession(sessionId: 'current');
      return true;
    } catch (e) {
      return false;
    }
  }
}
