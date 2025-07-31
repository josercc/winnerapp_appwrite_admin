import 'package:appwrite/appwrite.dart';

class AppwriteServer {
  final Client client = Client()
    ..setEndpoint("https://appwrite.winnermedical.com/v1")
    ..setProject("677f626b0012252b422e")
    ..setSelfSigned(status: true);
  late Account account;
  late Databases databases;

  String get appZipDatabase => '67d25037000787a18b45';
  String get appZipCollection => '67d25051001d789a270f';

  AppwriteServer() {
    account = Account(client);
    databases = Databases(client);
  }
}
