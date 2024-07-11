

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:today/items/button.dart';
import 'package:today/items/textformfield.dart';
import 'package:today/login/login.dart';

class SigUP extends StatefulWidget {
  const SigUP({super.key});

  @override
  State<SigUP> createState() => _SigUPState();
}

class _SigUPState extends State<SigUP> {
   final TextEditingController userName=TextEditingController();
   final TextEditingController email=TextEditingController();
   final TextEditingController password=TextEditingController();
   final GlobalKey<FormState> formState=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key:formState ,
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("images/logoTodoList.jpg",fit: BoxFit.cover,),
                ),
              ),
              Text("Todo List",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          
              SizedBox(height: 15,),
              TextFormFieldCus(title: "UserName", hintText: "Enter the UserName", myController: userName, valid:
               (val){
                if(val==""){
                  return "userName isEmpty";
                }
               },),
          
              SizedBox(height: 15,),
              TextFormFieldCus(title: "Email", hintText: "Enter Yuor Email", myController: email, valid:
               (val){
                if(val==""){
                  return "Email isEmpty";
                }}),
          
              SizedBox(height: 14,),
              TextFormFieldCus(title: "Password", hintText: "Enter the Password", myController: password, valid: (val){
                if(val==""){
                  return "Password isEmpty";
                }}),
          
              SizedBox(height: 30,),
              ButtonCus(tixt: "SignUp", tixtColor: const Color(0xff187870), buttonColor: Colors.black, borderSideColors:  Colors.black, pressed: () async{ 
                if(formState.currentState!.validate())  {
                  try {
                    // ignore: unused_local_variable
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                        }
                        } catch (e) {
                          print(e);
                          }

                          FirebaseAuth.instance.currentUser!.sendEmailVerification();
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LogIN(),), (route) => false);
                  
                };

                
               },),
              
              SizedBox(height: 15,),
          
              
          
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an account  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIN(),));
                      },
                      child: Text("LogIn",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff187870)),textAlign: TextAlign.center,)),
          
                  ],
                )
              ),
          
              SizedBox(height: 15,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 3,
                    width: 150,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8,),
          
                  Text("or",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(width: 8,),
                  Container(
                    height: 3,
                    width: 150,
                    color: Colors.grey,
                  )
          
                ],
              ),
          
              SizedBox(height: 20,),
              MaterialButton(
                color: Colors.black,
                height: 55,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(55),side: BorderSide(color: Colors.black,width: 2)) ,
                onPressed: (){},child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login with Google  ",style: TextStyle(color:Color(0xff187870),fontSize: 20,fontWeight: FontWeight.bold)),
                  Container(
                alignment: Alignment.center,
                width: 25,
                height: 25,
          
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset("images/logo google.jpg",fit: BoxFit.cover,),
                ),
              ),
          
                ],
              ),)
              
            ],
          
          ),
        ),


      ),
    );
  }
}