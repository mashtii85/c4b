import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.size = 80, this.fontSize = 15});

  final double size;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'lib/assets/images/logo.png',
          width: size,
          height: size,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'C4B Authentication',
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontSize: fontSize),
        ),
      ],
    );
  }
}
