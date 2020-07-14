// import 'dart:html';
// import 'dart:io';
// import 'dart:convert' as convert;

import 'package:highfives_ui/services/Identity/mock/allmock.dart';
// import 'package:http/http.dart' as http;

class SignUpService {
  Future<Map<dynamic, dynamic>> signUp() async {
    print('here');
    const url = 'https://jsonplaceholder.typicode.com/users';
    // var response = await http.get(url);
    // print(response.body);
    var a = signUpResMock;
    print(a);
    // var request = await new HttpClient().getUrl(Uri.parse(url));
    // var res = await request.close();
    // print(res);
    // await for (var contents in res.transform(convert.Utf8Decoder())) {
    //   print('^^^^' + contents);
    // }

    // print('resssssss' +)
    return signUpResMock;
  }
}
