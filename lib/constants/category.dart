import 'package:fashion_alley/urun_gosterme_sayfalari/alt.dart';
import 'package:fashion_alley/urun_gosterme_sayfalari/elbise.dart';
import 'package:fashion_alley/urun_gosterme_sayfalari/ust.dart';
import 'package:fashion_alley/constants/constants.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      color: arkaplan,
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryProducts(
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Alt()));
            },
            image: 'assets/images/bot.png',
            text: 'ALT',
          ),
          SizedBox(
            width: 10,
          ),
          CategoryProducts(
            image: 'assets/images/top.png',
            text: 'ÜST',
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Ust()));
            },
          ),
          SizedBox(
            width: 10,
          ),
          CategoryProducts(
            image: 'assets/images/dress.png',
            text: 'ELBİSE',
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Elbise()));
            },
          ),
        ],
      ),
    );
  }
}

class CategoryProducts extends StatelessWidget {
  const CategoryProducts(
      {Key? key, required this.image, required this.text, required this.press})
      : super(key: key);

  final String image, text;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          child: Chip(
            backgroundColor: kPrimaryColor,
            label: Row(
              children: [
                Image.asset(
                  image,
                  height: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
