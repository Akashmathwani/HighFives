import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        child: FlareActor(
          "assets/images/loading.flr",
          animation: 'loading',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          color: Colors.black,
        ),
      ),
    );
  }
}
