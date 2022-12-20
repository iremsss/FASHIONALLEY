
import 'package:flutter/material.dart';
import 'package:fashion_alley/products/header.dart';



class Elbise extends StatefulWidget{
  
  @override
  _ElbiseState createState() => _ElbiseState();
}
 class _ElbiseState extends State<Elbise>{
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            header("Elbise",context),
        
           
          ],),
          ),
        ],
      ),
      ),
   );
  }
  
 

 }