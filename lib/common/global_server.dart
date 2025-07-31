import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:winnerapp_appwrite_admin/common/appwrite_server.dart';

class GlobalServer extends GetxService {
  final AppwriteServer server = AppwriteServer();
}

GlobalServer get globalServer => Get.find<GlobalServer>();
