import 'package:fashion_alley/homeScreen.dart';
import 'package:flutter/material.dart';

class GScreen extends StatefulWidget {
  const GScreen({Key? key}) : super(key: key);

  @override
  State<GScreen> createState() => _GScreenState();
}

class _GScreenState extends State<GScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFDF8F8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
          ],
        ),
      ),
    );
  }
}
