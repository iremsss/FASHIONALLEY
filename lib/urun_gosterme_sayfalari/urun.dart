import 'package:fashion_alley/constants/category.dart';
import 'package:fashion_alley/urun_gosterme_sayfalari/products.dart';
import 'package:fashion_alley/constants/searchBar.dart';
import 'package:fashion_alley/constants/slider.dart';
import 'package:flutter/material.dart';

class Urun extends StatefulWidget {
  String uid;
  Urun({required this.uid});

  @override
  State<Urun> createState() => _UrunState();
}

class _UrunState extends State<Urun> {
  @override
  Widget build(BuildContext context) {
    String uid = widget.uid;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 5),
              SearchBar(),
              SizedBox(height: 5),
              FotoSlider(),
              SizedBox(height: 5),
              Category(),
              Products(uid: uid)
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
