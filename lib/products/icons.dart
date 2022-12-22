import 'package:flutter/material.dart';
import 'package:fashion_alley/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_alley/products/productDetail.dart';

Widget product_icon(BuildContext context){
  
 
  return Container(
    
                                                   
    child:Row(
                              
   children:[
      IconButton(

                                onPressed: () {
                                  
                                },
                                icon: Icon(
                                  
                                  Icons.location_on,
                                  size: 15,
                                  color: kPrimaryColor,
                                  
                                ),
                              ),
    IconButton(
                                onPressed: () {
                                  
                                },
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