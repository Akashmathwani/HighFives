import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHomeAppBar(context),
              _buildHomeBody(),
            ],
          ),
        ),
      ),
    );
  }

  List<String> menuList = ['Home', 'About', 'Pricing List', 'Contact Us'];

  _buildHomeAppBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Books',
              style: t0,
            ),
            Row(
              children: <Widget>[...textRow()],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> textRow() {
    List<Widget> textList = List<Widget>();
    for (var i = 0; i < menuList.length; i++) {
      Widget tex = Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          menuList[i],
          style: t1,
        ),
      );
      textList.add(tex);
    }
    return textList;
  }

  _buildHomeBody() {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            widthFactor: 0.6,
            alignment: Alignment.centerRight,
            child: Image.network(
              "https://cdn.dribbble.com/users/802605/screenshots/4861120/website_homepage_-_ui_design.png",
              scale: 0.85,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.6,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'WELCOME HERE MOTHERFUCKERS .......',
                  style: t2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle t0 = TextStyle(
    fontSize: 40, color: Colors.purple, fontFamily: "Montserrat-Bold");

TextStyle t1 =
    TextStyle(fontSize: 20, color: Colors.black, fontFamily: "Montserrat-Bold");

TextStyle t2 = TextStyle(
    fontSize: 40,
    color: Colors.black,
    letterSpacing: 2,
    fontFamily: "Montserrat-Bold");
