
import 'package:flutter/material.dart';
import 'package:fashion_alley/products/header.dart';



class UstGiyim extends StatefulWidget{
  
  @override
  _UstGiyimState createState() => _UstGiyimState();
}
 class _UstGiyimState extends State<UstGiyim>{
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            header("Üst Giyim",context),
        
           
          ],),
          ),
        ],
      ),
      ),
   );
  }
  
 

 }