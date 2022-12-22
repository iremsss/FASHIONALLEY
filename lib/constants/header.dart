import 'package:fashion_alley/constants/constants.dart';
import 'package:fashion_alley/urun_gosterme_sayfalari/productDetail.dart';
import 'package:fashion_alley/urun_gosterme_sayfalari/products.dart';
import 'package:fashion_alley/urun_gosterme_sayfalari/urun.dart';
import 'package:flutter/material.dart';

Widget header(String title, BuildContext context) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 25,
        ),
      ),
      Text(
        title,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20, color: kTextColor),
      ),
    ],
  );
}
