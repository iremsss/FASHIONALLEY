import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/constants.dart';
import 'package:fashion_alley/favorite.dart';
import 'package:fashion_alley/urun.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  String mail;
  homeScreen({required this.mail});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference urunRef = _firestore.collection('urun');
    CollectionReference personRef = _firestore.collection('Person');
    String mail = widget.mail;

    return Scaffold(
      backgroundColor: kBGColor,
      body: UrunBody(),
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
              Text(
                '${mail}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Favorite()));
                },
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle,
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
