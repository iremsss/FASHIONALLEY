import 'package:flutter/material.dart';
import 'package:fashion_alley/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/products/productDetail.dart';
import 'package:url_launcher/url_launcher.dart';

Widget product_icon(String web, String loc, BuildContext context) {
  _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  return Container(
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            _launchURL(loc);
          },
          icon: Icon(
            Icons.location_on,
            size: 15,
            color: kPrimaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            _launchURL(web);
          },
          icon: Icon(
            Icons.web_asset_outlined,
            size: 15,
            color: kPrimaryColor,
          ),
        ),
      ],
    ),
  );
}
