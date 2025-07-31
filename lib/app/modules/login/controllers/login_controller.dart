import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:winnerapp_appwrite_admin/common/functions.dart';
import 'package:winnerapp_appwrite_admin/common/global_server.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    final email = emailController.text;
    final password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      showError('请输入邮箱和密码');
      return;
    }
    SmartDialog.showLoading();
    globalServer.account
        .createEmailPasswordSession(email: email, password: password)
        .then(
      (value) {
        SmartDialog.dismiss();
        showSuccess('登录成功');
        Get.offAllNamed('/home');
      },
    ).catchError(
      (error) {
        SmartDialog.dismiss();
        showError(error.message);
      },
    );
  }
}
