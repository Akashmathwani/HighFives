import 'package:dio/dio.dart';
import 'package:ansicolor/ansicolor.dart';
import 'dart:convert';

class UiHttpClient {
  var _dio;
  final baseUrl = 'http://localhost:2020'; //TODO Change later
  BaseOptions _options;
  int i = 0;

  //THESE ALL ARE NOT THE PROPERTIES OF HTTP CLIENT THEREFORE NEEDS TO GO TO LOGGER
  AnsiPen greenPen = AnsiPen()..green();
  AnsiPen redPen = AnsiPen()..red();
  AnsiPen redTextBlueBackgroundPen = AnsiPen()
    ..blue(bg: true)
    ..red();

  factory UiHttpClient() {
    return _uiHttpClientSingleton;
  }

  static final UiHttpClient _uiHttpClientSingleton = UiHttpClient._internal();

  UiHttpClient._internal() {
    _options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
  }

  //Memoization
  get dio {
    if (_dio == null) {
      _dio = Dio(_options);
    }
    return _dio;
  }

  getData(String path, Map<String, String> headers,
      Map<String, String> body) async {
    i++;
    Stopwatch stopwatch = new Stopwatch()..start();
    //TODO: LOGGER AND PRINT INSIDE LOGGER. USE ANSIPEN IN DEV ENV ONLY -->  CAN READ CONFIGS
    print(greenPen('$i') +
        redPen('--- GET --> ') +
        '$baseUrl$path --> requestSent 0.0 sec');
    try {
      var response = await dio.get(baseUrl + path, data: body);
      print('$i <--- GET <-- $baseUrl$path <-- response ' +
          redTextBlueBackgroundPen('${stopwatch.elapsed} sec'));
      if (response.statusCode == 200) {
        return response;
      }
      return null;
    } on DioError catch (e) {
      //TODO : LOGGING

      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }
}

/*

Response Schema 
The response for a request contains the following information.

{
  /// Response body. may have been transformed, please refer to [ResponseType].
  T data;
  /// Response headers.
  Headers headers;
  /// The corresponding request info.
  Options request;
  /// Http status code.
  int statusCode;
  /// Whether redirect 
  bool isRedirect;  
  /// redirect info    
  List<RedirectInfo> redirects ;
  /// Returns the final real request uri (maybe redirect). 
  Uri realUri;    
  /// Custom field that you can retrieve it later in `then`.
  Map<String, dynamic> extra;
}
*/
