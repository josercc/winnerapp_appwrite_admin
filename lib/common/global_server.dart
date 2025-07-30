import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class GlobalServer extends GetxService {
  final Client client = Client()
    ..setEndpoint("https://appwrite.winnermedical.com/v1")
    ..setProject("677f626b0012252b422e")
    ..setSelfSigned(status: true);
}
