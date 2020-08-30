import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/size.dart';

class ExistingRelations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        children: [
          _buildFilterAndSearchSection(),
          // _buildBodySource(),
        ],
      ),
    );
  }
}

Widget _buildFilterAndSearchSection() {
  return Container(
    width: 200,
    height: 100,
    child: Text('SEARCH SECTION'),
  );
}

Widget _buildBodySource() {}
