import 'package:flutter/material.dart';
import 'package:highfives_ui/screens/loading.dart';

class Path {
  final String pathPattern;
  final Widget Function(BuildContext, String) builder;
  const Path(this.pathPattern, this.builder);

//we need to enter a regex here to match
  static List<Path> paths = [
    Path(r'^' + Loading.route, (context, match) => Loading())

    // static unknownPath(){
    //   return
    // };
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    //dynamic routes
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pathPattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }

    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    //TODO MAY BE LOG ?
    print('route not found' + settings.name);
    return null;
  }
}
