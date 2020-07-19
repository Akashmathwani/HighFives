import 'package:highfives_ui/resources/Identity/I_Identity.dart';
import 'package:highfives_ui/constants/const/platform.dart';
import 'package:highfives_ui/resources/Identity/WebIdentity.dart';
import 'package:highfives_ui/resources/Identity/appIdentity.dart';

// A WRAPPER TO IDENTIFY RESOURCES BASED ON WEB AND APPS
class IdentityResource extends I_Identity {
  final _webIdentity = WebIdentity();
  final _appIdentity = AppIdentity();
  dynamic _platform;

  IdentityResource(this._platform);

  @override
  Future<bool> signUp(String email, String password) async {
    print(_platform);
    switch (_platform) {
      case PLATFORMS.Web:
        return await _webIdentity.signUp(email, password);
      case PLATFORMS.Android:
      case PLATFORMS.Ios:
      case PLATFORMS.App:
      default:
        return await _appIdentity.signUp(email, password);
    }
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
