import 'package:carousel_pro/carousel_pro.dart';
import 'package:fashion_alley/constants.dart';
import 'package:flutter/material.dart';

class pSlider extends StatefulWidget {
  @override
  State<pSlider> createState() => _pSliderState();
}

class _pSliderState extends State<pSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 450,
        width: 350,
        child: Carousel(
          images: [
            AssetImage('assets/images/siyah_ust3.png'),
            AssetImage('assets/images/siyah_ust1.png'),
            AssetImage('assets/images/siyah_ust2.png'),
       
          ],
          borderRadius: true,
          radius: Radius.circular(10),
          dotBgColor: Colors.transparent,
          dotIncreasedColor: kPrimaryColor,
          animationCurve: Curves.fastOutSlowIn,
          
        ),
      ),
    );
  }
}
