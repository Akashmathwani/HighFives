import 'dart:convert';

import 'package:highfives_ui/constants/const/token.dart';
import 'package:highfives_ui/resources/Identity/I_Identity.dart';
import 'package:highfives_ui/resources/localStorage/WebLocalStorage.dart';
import 'package:highfives_ui/services/Identity/signup/signup.dart';
import 'package:highfives_ui/services/Identity/login/login.dart';

class WebIdentity extends I_Identity with WebLocalStorage {
  final _signupService = SignUpService();
  final _loginService = LoginService();

  @override
  Future<bool> signUp(String email, String password, String role) async {
    try {
      var res = await _signupService.attemptSignUp(email, password, role);
      if (res != null &&
          res['accessToken'] != null &&
          res['refreshToken'] != null) {
        await this.storeToken(res['accessToken'], TokenType.AccessToken);
        await this.storeToken(res['refreshToken'], TokenType.RefreshToken);
        return true;
      }
      //TODO:THROW_ERROR invalid response because we expect access and refresh in response;
    } catch (e) {
      //TODO:LOG_ERROR***
      return false;
    }
    return false;
  }

  @override
  Future<bool> login(String email, String password, String role) async {
    try {
      var res = await _loginService.attemptLogin(email, password, role);
      if (res != null &&
          res['accessToken'] != null &&
          res['refreshToken'] != null) {
        await this.storeToken(res['accessToken'], TokenType.AccessToken);
        await this.storeToken(res['refreshToken'], TokenType.RefreshToken);
        return true;
      }
      //TODO:THROW_ERROR invalid response because we expect access and refresh in response;
    } catch (e) {
      //TODO:LOG_ERROR***
      return false;
    }
    return false;
  }

  @override
  Future<bool> findtoken(dynamic tokenType) async {
     try {
      var token = await this.readToken(tokenType);
      if(token == null) token = "";

      var tokenComponents = token.split(".");
      if(tokenComponents.length !=3) {
        print("Invalid token format");
        return false;
      }

      var payload = json.decode(utf8.decode(base64.decode(base64.normalize(tokenComponents[1]))));
      if(DateTime.fromMillisecondsSinceEpoch(payload["exp"]*1000).isAfter(DateTime.now())) {
        print("Token is Valid");
        print(payload);
        return true;
      } else {
        print("Token Expired");
        return false;
      }

    } catch (e) {
      //TODO:LOG_ERROR***
      return false;
    }
  }

  @override
  void logout() {
    this.deleteToken(TokenType.AccessToken);
    this.deleteToken(TokenType.RefreshToken);
    return null;
  }

  @override
  void refresh() {
    return null;
  }
}
