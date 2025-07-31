import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:winnerapp_appwrite_admin/common/functions.dart';
import 'package:winnerapp_appwrite_admin/common/global_server.dart';

class HomeController extends GetxController {
  int offset = 0;
  int count = 20;
  final RxList<Document> appZipList = <Document>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAppZip();
  }

  void loadAppZip() async {
    SmartDialog.showLoading();
    final database = globalServer.server.databases;
    await database.listDocuments(
      databaseId: globalServer.server.appZipDatabase,
      collectionId: globalServer.server.appZipCollection,
      queries: [
        Query.offset(offset),
        Query.limit(count),
      ],
    ).catchError((error) {
      SmartDialog.dismiss();
      showError(error.toString());
    }).then((value) {
      SmartDialog.dismiss();
      appZipList.value = value.documents;
    });
  }
}
