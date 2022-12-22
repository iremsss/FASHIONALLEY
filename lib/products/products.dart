import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/constants.dart';
import 'package:fashion_alley/products/productDetail.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  String uid;
  Products({required this.uid});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String uid = widget.uid;
    CollectionReference urunRef = _firestore.collection('urun');

    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: urunRef.snapshots(),
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
                        itemCount: listodDocumentSnapshot.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
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
                                trailing: newMethod(
                                    '${listodDocumentSnapshot[index]['id']}'),
                              )
                            ],
                          );
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

  Container newMethod(String a) {
    return Container(
      height: 90,
      width: 30,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailPage(urun_id: a, uid: widget.uid)),
          );
        },
        icon: Icon(
          Icons.arrow_forward_outlined,
          size: 15,
        ),
      ),
    );
  }
}
