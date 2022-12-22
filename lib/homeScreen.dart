import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/constants.dart';
import 'package:fashion_alley/favorite.dart';
import 'package:fashion_alley/main.dart';
import 'package:fashion_alley/urun.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  String uid;
  homeScreen({required this.uid});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference urunRef = _firestore.collection('urun');
    CollectionReference personRef = _firestore.collection('Person');
    String uid = widget.uid;
    print(uid);
    List<dynamic> favListt;
    List<int> favList = [];

    return Scaffold(
      backgroundColor: kBGColor,
      body: UrunBody(uid: uid),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -5),
                blurRadius: 10,
              )
            ]),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    FirebaseFirestore.instance
                        .collection("Person")
                        .doc(uid)
                        .get()
                        .then((value) {
                      favListt = value.get('favlar');
                      List<int> favList =
                          favListt.map((e) => int.parse(e)).toList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Favori(
                            uid: uid,
                            favList: favList,
                          ),
                        ),
                      );
                    });
                  });
                },
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                icon: Icon(
                  Icons.logout,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
