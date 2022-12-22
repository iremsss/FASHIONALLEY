import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/constants.dart';
import 'package:fashion_alley/products/productDetail.dart';
import 'package:flutter/material.dart';

import '../products/header.dart';

class Favori extends StatefulWidget {
  String uid;
  Favori({required this.uid});

  @override
  State<Favori> createState() => _FavoriState();
}

class _FavoriState extends State<Favori> {
  final _firestor = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String uid = widget.uid;
    CollectionReference urunRef = _firestor.collection('urun');

    List<Offset> favList = <Offset>[];

    /*getdata() async {
      await FirebaseFirestore.instance
          .collection("User")
          .doc(uid)
          .get()
          .then((value) {
        setState(() {
          // first add the data to the Offset object
          List.from(value.data()).forEach((element) {
            Offset data = new Offset(element);

            //then add the data to the List<Offset>, now we have a type Offset
            favList.add(data);
          });
        });
      });
    }*/

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            header('Favoriler', context),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.abc_outlined,
                size: 25,
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('urun')
                    .where('favori', isEqualTo: 'y')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
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
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.70),
                          itemCount: asyncSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              Container(
                                height: 150,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Image.network(
                                    '${listodDocumentSnapshot[index]['image1']}'),
                              ),
                              ListTile(
                                title: Text(
                                    '${listodDocumentSnapshot[index]['isim']}'),
                                subtitle: Text(
                                  '${listodDocumentSnapshot[index]['fiyat']}',
                                ),
                              )
                            ]);
                          },
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
      ),
    );
  }
}
