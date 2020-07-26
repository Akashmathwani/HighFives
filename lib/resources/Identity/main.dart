import 'package:highfives_ui/resources/Identity/I_Identity.dart';
import 'package:highfives_ui/constants/const/platform.dart';
import 'package:highfives_ui/resources/Identity/WebIdentity.dart';
import 'package:highfives_ui/resources/Identity/AppIdentity.dart';

// A WRAPPER TO IDENTIFY RESOURCES BASED ON WEB AND APPS
class IdentityResource extends I_Identity {
  final _webIdentity = WebIdentity();
  final _appIdentity = AppIdentity();
  dynamic _platform;

  IdentityResource(this._platform);

  @override
  Future<bool> signUp(String email, String password, String role) async {
    print(_platform);
    switch (_platform) {
      case PLATFORMS.Web:
        return await _webIdentity.signUp(email, password, role);
      case PLATFORMS.Android:
      case PLATFORMS.Ios:
      case PLATFORMS.App:
      default:
        return await _appIdentity.signUp(email, password, role);
    }
  }

  @override
  Future<bool> login(String email, String password, String role) async {
    print(_platform);
    switch (_platform) {
      case PLATFORMS.Web:
        return await _webIdentity.login(email, password, role);
      case PLATFORMS.Android:
      case PLATFORMS.Ios:
      case PLATFORMS.App:
      default:
        return await _appIdentity.login(email, password, role);
    }
  }

  @override
  Future<bool> findtoken(dynamic tokenType) async {
    print(_platform);
    switch (_platform) {
      case PLATFORMS.Web:
        return await _webIdentity.findtoken(tokenType);
      case PLATFORMS.Android:
      case PLATFORMS.Ios:
      case PLATFORMS.App:
      default:
        return await _appIdentity.findtoken(tokenType);
    }
  }

  @override
  Future<bool> logout() async {
    print(_platform);
    switch (_platform) {
      case PLATFORMS.Web:
        return await _webIdentity.logout();
      case PLATFORMS.Android:
      case PLATFORMS.Ios:
      case PLATFORMS.App:
      default:
        return await _appIdentity.logout();
    }
  }

  @override
  void refresh() {
    return null;
  }
}
