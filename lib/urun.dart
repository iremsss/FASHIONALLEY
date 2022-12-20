import 'package:fashion_alley/category/category.dart';
import 'package:fashion_alley/products/products.dart';
import 'package:fashion_alley/searchBar.dart';
import 'package:fashion_alley/slider/slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'customAppBar.dart';

class UrunBody extends StatefulWidget {
  const UrunBody({Key? key}) : super(key: key);

  @override
  State<UrunBody> createState() => _UrunBodyState();
}

class _UrunBodyState extends State<UrunBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(
            children: [
              customAppBar(),
              SizedBox(height: 5),
              SearchBar(),
              SizedBox(height: 5),
              FotoSlider(),
              SizedBox(height: 5),
              Category(),
              Container(
                height: 200,
                child: Products(),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
