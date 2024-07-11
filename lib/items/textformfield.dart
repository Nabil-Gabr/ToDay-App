// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFormFieldCus extends StatelessWidget {
 final String? Function(String?)? valid;
  final String title;
  final String hintText;
  final TextEditingController myController;
  
 
  
 
   TextFormFieldCus({super.key, required this.title, required this.hintText, required this.myController,required this.valid, });

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(title,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),

                    SizedBox(height: 5,),

                  TextFormField(
                     
                    validator: valid,
                      controller: myController,
                      decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText:hintText,
                      hintStyle: TextStyle(color: Colors.black),
                  
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color:Colors.black,width: 2),
                    ),
                  
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color:Colors.black,width: 2),
                    
                  
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color:Colors.black,width: 2),
                    
                  
                    ),
                      
                      
                        
                    ),
                    
                  ),
                ],
              );
  }
}