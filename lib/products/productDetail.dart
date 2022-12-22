import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/constants.dart';
import 'package:fashion_alley/products/icons.dart';
import 'package:flutter/material.dart';

import 'package:fashion_alley/products/header.dart';

class ProductDetailPage extends StatefulWidget {
  String urun_id;
  ProductDetailPage({required this.urun_id});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    String urun_id = widget.urun_id;
    print("ürün id si : ");
    print(urun_id);
    final urunRef = FirebaseFirestore.instance.collection('urun');

    /*FirebaseFirestore.instance
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
    });*/

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: urunRef.snapshots(),
                    builder:
                        (BuildContext context, AsyncSnapshot asyncSnapshot) {
                      if (asyncSnapshot.hasError) {
                        return Center(
                          child: Text('hata oluştu tekrar deneyiniz'),
                        );
                      } else {
                        if (asyncSnapshot.hasData) {
                          List<DocumentSnapshot> listodDocumentSnapshot =
                              asyncSnapshot.data.docs;
                          return Container(
                            height: 250,
                            child: ListView(
                              children: [
                                header(
                                    '${listodDocumentSnapshot[int.parse(urun_id) - 1]['isim']}',
                                    context),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                          '${listodDocumentSnapshot[int.parse(urun_id) - 1]['renk']}'),
                                      Container(
                                        height: 450,
                                        width: 350,
                                        child: Carousel(
                                          images: [
                                            Image.network(
                                                '${listodDocumentSnapshot[int.parse(urun_id) - 1]['image1']}'),
                                            Image.network(
                                                '${listodDocumentSnapshot[int.parse(urun_id) - 1]['image2']}'),
                                            Image.network(
                                                '${listodDocumentSnapshot[int.parse(urun_id) - 1]['image3']}'),
                                          ],
                                          borderRadius: true,
                                          radius: Radius.circular(10),
                                          dotBgColor: Colors.transparent,
                                          dotIncreasedColor: kPrimaryColor,
                                          animationCurve: Curves.fastOutSlowIn,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${listodDocumentSnapshot[int.parse(urun_id) - 1]['fiyat']}  TL',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: kTextColor),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.favorite_outline_rounded,
                                              size: 20,
                                              color: kPrimaryColor,
                                            ),
                                            alignment: Alignment.centerRight,
                                          ),
                                        ],
                                      ),
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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
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
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
