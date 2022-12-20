
import 'package:fashion_alley/CurrentLocationScreen.dart';
import 'package:flutter/material.dart';
import 'package:fashion_alley/constants.dart';

Widget product_icon(BuildContext context){
  
  return Container(
    
                                                   
    child:Row(
                              
   
    children:[
    IconButton(

                                onPressed: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (context) => Location()));
                                },
                                icon: Icon(
                                  
                                  Icons.location_on,
                                  size: 15,
                                  color: kPrimaryColor,
                                  
                                ),
                              ),
    IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.web_asset_outlined,
                                  size: 15,
                                  color: kPrimaryColor,
                                  
                                ),
                              ),

 
    ],
    ),
  );

}