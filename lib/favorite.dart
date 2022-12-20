import 'package:fashion_alley/products/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:fashion_alley/products/header.dart';



class Favorite extends StatefulWidget{
  
  @override
  _FavoriteState createState() => _FavoriteState();
}
 class _FavoriteState extends State<Favorite>{
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            header("Favoriler",context),
        
           
          ],),
          ),
        ],
      ),
      ),
   );
  }
  
 

 }
