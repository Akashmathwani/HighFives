import 'package:highfives_ui/constants/const/token.dart';
import 'package:highfives_ui/resources/Identity/I_Identity.dart';
import 'package:highfives_ui/resources/localStorage/WebLocalStorage.dart';
import 'package:highfives_ui/services/Identity/signup/signup.dart';

class WebIdentity extends I_Identity with WebLocalStorage {
  final _signupService = SignUpService();

  @override
  Future<bool> signUp(String email, String password, String role) async {
    try {
      var res = await _signupService.attemptSignUp(email, password, role);
      if (res != null &&
          res['accessToken'] != null &&
          res['refreshToken'] != null) {
        await this.storeToken(res['accessToken'], TokenType.AcceessToken);
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
  void login(String email, String password) {
    return null;
  }

  @override
  void logout() {
    return null;
  }

  @override
  void refresh() {
    return null;
  }
}
