import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/constants.dart';
import 'package:fashion_alley/products/productDetail.dart';
import 'package:flutter/material.dart';

class Elbise extends StatefulWidget {
  const Elbise({Key? key}) : super(key: key);

  @override
  State<Elbise> createState() => _ElbiseState();
}

class _ElbiseState extends State<Elbise> {
  final _firestor = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference urunRef = _firestor.collection('urun');

    return Card(
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('urun')
                  .where('tür', isEqualTo: 'elbise')
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                              trailing: Icon(Icons.add),
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
    );
  }
}
