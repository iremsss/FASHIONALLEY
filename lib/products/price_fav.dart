
import 'package:fashion_alley/constants.dart';
import 'package:fashion_alley/products/products.dart';
import 'package:flutter/material.dart';

Widget price_fav( BuildContext context){
  
  return Row(
   
    children:[
      Text("199.99 TL",
            textAlign: TextAlign.left,
            style:  const TextStyle(fontSize: 15 ,
            fontWeight: FontWeight.w400,
            
            color: kTextColor),
            
            ),
  

 IconButton(
  padding: EdgeInsets.all(0),
  
                                onPressed: () {
                                  
                                },
                               
                              
                                icon: Icon(
                                  
                                  Icons.favorite_outline_rounded,
                                  
                                  size: 20,
                                  color: kPrimaryColor,
                                  
                                ),
                                alignment: Alignment.centerRight,
                              ),
 

  
    ],
  
  );

}