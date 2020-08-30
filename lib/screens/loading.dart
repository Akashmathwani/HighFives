import 'package:flutter/material.dart';
import 'package:highfives_ui/utils/widgets/Loading/cubegrid.dart';

class Loading extends StatefulWidget {
  static const route = '/loading';
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Color _color = Colors.black;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  void initState() {
    setState(() {
      _color = Colors.white;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    setState(() {
      _color = _color == Colors.white ? Colors.black : Colors.white;
    });
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          width: size.width,
          height: size.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Text(
                  'Loading Data...',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SpinKitCubeGrid(
                color: Colors.orange,
                size: size.width / 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
