import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/constants/constants.dart';
import 'package:fashion_alley/constants/icons.dart';
import 'package:flutter/material.dart';

import 'package:fashion_alley/constants/header.dart';

class ProductDetailPage extends StatefulWidget {
  String urun_id;
  String uid;
  ProductDetailPage({required this.urun_id, required this.uid});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    String uid = widget.uid;
    String urun_id = widget.urun_id;
    final urunRef = FirebaseFirestore.instance.collection('urun');

    ekle() {
      var collection = FirebaseFirestore.instance.collection('Person');
      collection
          .doc(uid)
          .update({
            'favlar': FieldValue.arrayUnion([urun_id])
          })
          .then((_) => print('Added'))
          .catchError((error) => print('Add failed: $error'));
    }

    kaldir() {
      var collection = FirebaseFirestore.instance.collection('Person');
      collection
          .doc(uid)
          .update({
            'favlar': FieldValue.arrayRemove([urun_id])
          })
          .then((_) => print('Deleted'))
          .catchError((error) => print('Add failed: $error'));
    }

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
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                color: kTextColor),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              ekle();
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              size: 40,
                                              color: kPrimaryColor,
                                            ),
                                            alignment: Alignment.centerRight,
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              kaldir();
                                            },
                                            icon: Icon(
                                              Icons.heart_broken,
                                              size: 40,
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
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: kTextColor),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: product_icon(
                                              '${listodDocumentSnapshot[int.parse(urun_id) - 1]['site']}',
                                              '${listodDocumentSnapshot[int.parse(urun_id) - 1]['adres']}',
                                              context)),
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
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailPage(
                                                        uid: uid,
                                                        urun_id:
                                                            '${listodDocumentSnapshot[int.parse(urun_id) - 1]['kombin_id']}'),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            "Kombini Tamamla",
                                            style: TextStyle(
                                              color: kTextColor,
                                              fontSize: 20.0,
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
