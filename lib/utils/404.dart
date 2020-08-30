import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  final String name;
  const UnknownPage({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('in unknown ${this.name}');
    return Scaffold(
      body: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Column(
          children: [
            Center(
              child: Text(
                'Page Not Found',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/images/404.jpg")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
