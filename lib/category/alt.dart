
import 'package:flutter/material.dart';
import 'package:fashion_alley/products/header.dart';



class AltGiyim extends StatefulWidget{
  
  @override
  _AltGiyimState createState() => _AltGiyimState();
}
 class _AltGiyimState extends State<AltGiyim>{
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            header("Alt Giyim",context),
        
           
          ],),
          ),
        ],
      ),
      ),
   );
  }
  
 

 }
