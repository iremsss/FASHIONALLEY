import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/constants.dart';
import 'package:fashion_alley/products/icons.dart';

import 'package:fashion_alley/products/price_fav.dart';
import 'package:fashion_alley/products/product_slider.dart';
import 'package:flutter/material.dart';

import 'package:fashion_alley/products/header.dart';

class ProductDetailPage extends StatefulWidget {
  String urun_id;
  ProductDetailPage({required this.urun_id});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class Urun {
  final int fiyat;
  final String image1;
  final String image2;
  final String image3;
  final String isim;
  final int kombin_id;
  final String kombin_image;
  final String marka;
  final String renk;
  final String sitee;
  final String tur;

  Urun(
      {required this.renk,
      required this.isim,
      required this.fiyat,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.kombin_id,
      required this.kombin_image,
      required this.marka,
      required this.sitee,
      required this.tur});
// Firebase'den Json olarak gelen Map'i(Json'ı) Dart Class'ına dönüştürüyoruz.
  Urun.fromJson(Map<String, Object?> json)
      : this(
          fiyat: json['fiyat']! as int,
          image1: json['image1']! as String,
          image2: json['image2']! as String,
          image3: json['image3']! as String,
          isim: json['isim']! as String,
          kombin_id: json['kombin_id']! as int,
          kombin_image: json['kombin_image']! as String,
          marka: json['marka']! as String,
          renk: json['renk']! as String,
          sitee: json['sitee']! as String,
          tur: json['tür']! as String,
        );

// Firebase'e göndereceğimiz Map'i(Json'ı) Dart Class'ından Json'a dönüştürüyoruz.
  Map<String, Object?> toJson() {
    return {
      'title': renk,
      'genre': isim,
    };
  }
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    String urun_id = widget.urun_id;
    String urunrengi = "boş";
    print("ürün id si : ");
    print(urun_id);
    final urunRef = FirebaseFirestore.instance.collection('urun');

    FirebaseFirestore.instance
        .collection('urun')
        .doc(urun_id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        print('${documentSnapshot.get('renk')}');
        urunrengi = documentSnapshot.get('renk');
        print(urunrengi);
      } else {
        print('Document does not exist on the database');
      }
    });

    print(urunrengi);
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
                        Text(urunrengi),
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
