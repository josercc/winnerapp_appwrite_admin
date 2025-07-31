import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

void showError(String message) {
  showMessage(message, QuickAlertType.error);
}

void showSuccess(String message) {
  showMessage(message, QuickAlertType.success);
}

void showInfo(String message) {
  showMessage(message, QuickAlertType.info);
}

void showWarning(String message) {
  showMessage(message, QuickAlertType.warning);
}

void showMessage(String message, QuickAlertType type) {
  QuickAlert.show(
    context: Get.context!,
    type: type,
    text: message,
  );
}
