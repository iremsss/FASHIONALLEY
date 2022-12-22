import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../products/header.dart';
import 'constants.dart';

class Favori extends StatefulWidget {
  String uid;
  List<int> favList;
  Favori({required this.uid, required this.favList});

  @override
  State<Favori> createState() => _FavoriState();
}

class _FavoriState extends State<Favori> {
  @override
  Widget build(BuildContext context) {
    List<int> favList = widget.favList;

    return Card(
      color: kBGColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
          children: [
            header('Favoriler', context),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('urun')
                    .where('id', whereIn: favList)
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
                        color: arkaplan,
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
