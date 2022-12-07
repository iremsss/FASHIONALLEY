import 'package:flutter/material.dart';

import 'constants.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        Column(
          children: [
            Text(
              'Pelinsu',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            Text(
              'İstanbul',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: kPrimaryColor,
        ),
      ],
    );
  }
}
