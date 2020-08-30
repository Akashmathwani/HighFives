import 'package:highfives_ui/services/request/global_request.dart';

class SignUpService {
  final httpClient = UiHttpClient();
  Future<Map<String, dynamic>> attemptSignUp(
      String email, String password, String role) async {
    const path = '/identity/loginWithEmailAndPasswordAndRole';

    final user = {'email': email, 'password': password, 'role': role};
    try {
      var response = await httpClient.postData(path, null, user);
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data is Map) {
        return response.data;
      } else {
        //TODO:LOG_ERROR
        //TODO:THROW_ERROR  //this error to be catch in resources and should be added to logging
        throw Exception('Failed to signUp From SignUpService');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
