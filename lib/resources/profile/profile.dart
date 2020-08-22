import 'package:highfives_ui/resources/profile/mock.dart';

class Profile {
  Future<dynamic> getProfile(String role) async {
    await Future.delayed(Duration(microseconds: 200));
    return tnpProfileMock;
  }
}
