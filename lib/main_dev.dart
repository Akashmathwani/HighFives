import 'package:highfives_ui/constants/const/banner.dart';
import 'package:highfives_ui/environment.dart';
import 'package:highfives_ui/main_common.dart';
import 'package:ansicolor/ansicolor.dart';

Future<void> main() async {
  print(HIGHFIVES_BANNER);
  await mainCommon(Environment.dev);
}
