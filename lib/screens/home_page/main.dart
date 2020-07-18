import 'package:flutter/material.dart';

//TODO DEMO
class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'LoginSucess',
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Image.network(
              "https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg"),
        ),
      ),
    );
  }
}
