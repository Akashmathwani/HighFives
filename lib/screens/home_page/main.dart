import 'package:flutter/material.dart';
import 'package:highfives_ui/resources/Identity/main.dart';
import 'package:highfives_ui/screens/login/demo_login.dart';
import 'package:highfives_ui/utils/platform.dart';

//TODO DEMO
class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  final _identityResource = IdentityResource(findPlatform());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'LoginSucess',
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                  "https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg"),
            ),
            FlatButton(
              onPressed: () async {
                await _logout();
                Navigator.push(context, MaterialPageRoute(builder: (context) => DemoLogin()));
              },
              child: Text("Logout")
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _logout()async {
     return await _identityResource.logout();
  }

}
