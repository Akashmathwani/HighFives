import 'package:flutter_test/flutter_test.dart';
import 'package:highfives_ui/services/Identity/mock/allmock.dart';
import 'package:highfives_ui/services/Identity/signup/signup.dart';
import 'package:mockito/mockito.dart';

class SignUpMockClient extends Mock implements SignUpService {}

main() {
  group('signUp Cases', () {
    test('should return token if sign up is success', () async {
      final client = SignUpMockClient();
      when(client.signUp()).thenAnswer((_) async => signUpResMock);
      var res = await client.signUp();
      print(res);
      expect(res['status'], 200);
      expect(res['refreshToken'] != null, true);
      expect(res['accessToken'] != null, true);
      expect(res['message'] != null, true);
    });
  });
}