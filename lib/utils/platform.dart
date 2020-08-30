import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:highfives_ui/constants/const/platform.dart';

findPlatform() {
  if (kIsWeb) {
    return PLATFORMS.Web;
  }
  return PLATFORMS.App;
}
