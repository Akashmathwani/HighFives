import 'package:highfives_ui/constants/const/token.dart';
import 'package:highfives_ui/resources/Identity/I_Identity.dart';
import 'package:highfives_ui/resources/localStorage/AppLocalStorage.dart';
import 'package:highfives_ui/services/Identity/signup/signup.dart';

class AppIdentity extends I_Identity with AppLocalStorage {
  final _signupService = SignUpService();

  @override
  Future<bool> signUp(String email, String password) async {
    try {
      var res = await _signupService.signUp(email, password);
      if (res != null) {
        await this.storeToken(res['accessToken'], TokenType.AcceessToken);
        await this.storeToken(res['refreshToken'], TokenType.RefreshToken);
        return true;
      }
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
