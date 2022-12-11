import 'package:flutter/material.dart';

class MainTab extends StatelessWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.grey[900],
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.grey[500],
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.tealAccent[200],
        ),
        Container(
          width: 50,
          height: 50,
          color: Color(0x1FFFFFFF),
        ),
        Container(
          width: 50,
          height: 50,
          color: Color(0x1F000000),
        ),
        Container(
          width: 50,
          height: 50,
          color: Color(0x1FFFFFFF),
        ),
      ],
    );
  }
}
