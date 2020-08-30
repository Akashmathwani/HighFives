import 'package:highfives_ui/constants/const/token.dart';
import 'dart:html' as dhtml;
import 'dart:convert';

class WebLocalStorage {
  final dhtml.Storage _localStorage = dhtml.window.localStorage;

  //By Default Stores as AccessToken if type is not sent
  Future<void> storeToken(String token, dynamic type) async {
    switch (type) {
      case TokenType.AccessToken:
        _localStorage[ACCESSTOKENKEY] = token;
        break;
      case TokenType.RefreshToken:
        _localStorage[REFRESHTOKENKEY] = token;
        break;
      default:
        _localStorage[ACCESSTOKENKEY] = token;
        break;
    }
  }

  //By Default reads AccessToken if type is not sent`
  Future<String> readToken(dynamic type) async {
    switch (type) {
      case TokenType.AccessToken:
        return _localStorage.containsKey(ACCESSTOKENKEY)
            ? _localStorage[ACCESSTOKENKEY]
            : "";
      case TokenType.RefreshToken:
        return _localStorage.containsKey(REFRESHTOKENKEY)
            ? _localStorage[REFRESHTOKENKEY]
            : "";
      default:
        return _localStorage.containsKey(ACCESSTOKENKEY)
            ? _localStorage[ACCESSTOKENKEY]
            : "";
    }
  }

  //By Default deletes AccessToken if type is not sent
  Future<void> deleteToken(dynamic type) async {
    switch (type) {
      case TokenType.AccessToken:
        return _localStorage.remove(ACCESSTOKENKEY);
      case TokenType.RefreshToken:
        return _localStorage.remove(REFRESHTOKENKEY);
      default:
        return _localStorage.remove(ACCESSTOKENKEY);
    }
  }

  Future<Map<String, String>> readAllStoredData() async {
    return _localStorage;
  }

  Future<dynamic> stringifyAllStoredData() async {
    return json.encode(_localStorage);
  }

  Future<void> clearAllData() async {
    _localStorage.clear();
  }
}
