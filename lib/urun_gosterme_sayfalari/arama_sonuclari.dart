import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/constants/constants.dart';
import 'package:fashion_alley/constants/header.dart';
import 'package:flutter/material.dart';

class Arama extends StatefulWidget {
  String aranan;
  Arama({required this.aranan});

  @override
  State<Arama> createState() => _AramaState();
}

class _AramaState extends State<Arama> {
  @override
  Widget build(BuildContext context) {
    String aranan = widget.aranan;
    return Card(
      color: kBGColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
          children: [
            header('Arama Sonuçları', context),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('urun')
                    .orderBy('isim')
                    .startAt([aranan]).endAt([aranan + '\uf8ff']).snapshots(),
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
                                padding: EdgeInsets.all(5),
                                height: 200,
                                child: Image.network(
                                    '${listodDocumentSnapshot[index]['image1']}'),
                              ),
                              ListTile(
                                title: Text(
                                    '${listodDocumentSnapshot[index]['isim']}'),
                                subtitle: Text(
                                  '${listodDocumentSnapshot[index]['fiyat']}',
                                ),
                                //trailing: Icon(Icons.add),
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
