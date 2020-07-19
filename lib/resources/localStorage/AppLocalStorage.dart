import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:highfives_ui/constants/const/token.dart';

class AppLocalStorage {
  final _storage = FlutterSecureStorage();

  //By Default Stores as AccessToken if type is not sent
  Future<void> storeToken(String token, dynamic type) async {
    switch (type) {
      case TokenType.AcceessToken:
        await _storage.write(key: ACCESSTOKENKEY, value: token);
        break;
      case TokenType.RefreshToken:
        await _storage.write(key: REFRESHTOKENKEY, value: token);
        break;
      default:
        await _storage.write(key: ACCESSTOKENKEY, value: token);
        break;
    }
  }

  //By Default reads AccessToken if type is not sent
  Future<String> readToken(dynamic type) async {
    switch (type) {
      case TokenType.AcceessToken:
        return await _storage.read(key: ACCESSTOKENKEY);
      case TokenType.RefreshToken:
        return await _storage.read(key: REFRESHTOKENKEY);
      default:
        return await _storage.read(key: ACCESSTOKENKEY);
    }
  }

  //By Default deletes AccessToken if type is not sent
  Future<void> deleteToken(dynamic type) async {
    switch (type) {
      case TokenType.AcceessToken:
        return await _storage.delete(key: ACCESSTOKENKEY);
      case TokenType.RefreshToken:
        return await _storage.delete(key: REFRESHTOKENKEY);
      default:
        return await _storage.delete(key: ACCESSTOKENKEY);
    }
  }

  Future<Map<String, String>> readAllStoredData() async {
    return await _storage.readAll();
  }
}
