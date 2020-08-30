import 'package:flutter_test/flutter_test.dart';
import 'package:highfives_ui/services/Identity/mock/allmock.dart';
import 'package:highfives_ui/services/Identity/signup/signup.dart';
import 'package:highfives_ui/services/request/global_request.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements UiHttpClient {}

main() {
  group('signUp Cases\n', () {
    final signUpService = SignUpService();
    String email = 'abc@mail.com';
    String password = 'highfives';
    const path = '/signUp';

    test('should return token if sign up is success or resposne is 201',
        () async {
      var res = await signUpService.attemptSignUp(email, password, null);

      expect(res != null, true);
      expect(res['status'], 200);
      expect(res['refreshToken'] != null, true);
      expect(res['accessToken'] != null, true);
      expect(res['message'] != null, true);
    });
    test('should thwor error api response is not 201', () async {
      final httpClient = MockClient();
      when(httpClient.getData(any, any))
          .thenAnswer((_) => Future.value(signUpResMock));
      var res = await signUpService.attemptSignUp(email, password, null);

      expect(res == null, true);
    });
  });
}
