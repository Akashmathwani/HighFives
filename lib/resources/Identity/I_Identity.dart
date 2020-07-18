// To make Interfaces start with I_
// abstract class as no object can be initialized from this
// abstract method needs to be overridden in the child class, normal methods are not compulsary

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:highfives_ui/constants/const/token.dart';

abstract class I_Identity {
  final _storage = FlutterSecureStorage();

  void login();
  Future<bool> signUp(String e, String p);
  void refresh();
  void logout();

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
