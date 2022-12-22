import 'package:carousel_pro/carousel_pro.dart';
import 'package:fashion_alley/constants/constants.dart';
import 'package:flutter/material.dart';
/*
  Anasayfadaki slider, burada uygulamanın kendi resimleri gösteriliyor.
 */

class FotoSlider extends StatefulWidget {
  @override
  State<FotoSlider> createState() => _FotoSliderState();
}

class _FotoSliderState extends State<FotoSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 300,
        child: Carousel(
          images: [
            AssetImage('assets/images/image1.jpg'),
            AssetImage('assets/images/image2.jpg'),
            AssetImage('assets/images/image3.jpg'),
            AssetImage('assets/images/image4.jpg'),
          ],
          borderRadius: true,
          radius: Radius.circular(30),
          dotBgColor: Colors.transparent,
          dotIncreasedColor: kPrimaryColor,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(
            milliseconds: 800,
          ),
        ),
      ),
    );
  }
}
