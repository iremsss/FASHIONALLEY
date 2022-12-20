import 'package:fashion_alley/constants.dart';
import 'package:fashion_alley/products/icons.dart';

import 'package:fashion_alley/products/price_fav.dart';
import 'package:fashion_alley/products/product_slider.dart';
import 'package:flutter/material.dart';

import 'package:fashion_alley/products/header.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  header("Bershka Siyah Bluz", context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        pSlider(),
                        price_fav(context),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Satın Alma Seçenekleri",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: kTextColor),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: product_icon(context),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RawMaterialButton(
                            fillColor: kPrimaryColor,
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {},
                            child: const Text(
                              "Kombini Tamamla",
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
