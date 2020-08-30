import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/resources/profile/Iprofile.dart';
import 'package:highfives_ui/resources/profile/mock.dart';

class Profile extends IProfile {
  //TODO INTEGRATE WITH SERVICE
  Future<dynamic> getProfile(String role) async {
    if (role == TNP) {
      await Future.delayed(Duration(seconds: 2));
      return tnpProfileMock;
    } else if (role == EMPLOYER) {
      await Future.delayed(Duration(seconds: 2));
      return employerProfileMock;
    }
  }
}
