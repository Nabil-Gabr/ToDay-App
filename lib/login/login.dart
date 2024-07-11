

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:today/items/button.dart';
import 'package:today/items/textformfield.dart';
import 'package:today/login/sigup.dart';
import 'package:today/screens/homepage.dart';

class LogIN extends StatefulWidget {
  const LogIN({super.key});

  @override
  State<LogIN> createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  GlobalKey<FormState> formkey=GlobalKey();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              SizedBox(height: 60,),
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
              SizedBox(height: 20,),
              TextFormFieldCus(
                title: "Email", hintText: "Enter Yuor Email", myController: email,
                valid: (val){
                  if(val==""){
                    return "email cant be empty";
                  }
                },
                ),
          
              SizedBox(height: 20,),
              TextFormFieldCus(title: "Password", hintText: "Enter the Password", myController: password,
               valid: (val){
                  if(val==""){
                    return "password cant be empty";
                  }}
              ),
          
              SizedBox(height: 40,),
              ButtonCus(tixt: "Log in", tixtColor: const Color(0xff187870), buttonColor: Colors.black, borderSideColors:  Colors.black, pressed: () async { 
                if(formkey.currentState!.validate()){
                  try {
                    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text,
                      password: password.text
                    );
                    
                    if(credential.user!.emailVerified){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
                      }else{
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          animType: AnimType.rightSlide,
                          title: 'تنبيه',
                          desc: ' الرجاء الذهاب الي بريدك الاكتروني والتحقق منه',
                          ).show();
                        
                        }
                       

                    } on FirebaseAuthException catch (e) {

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
                      // if (e.code == 'user-not-found') {
                      //   print('===================No user found for that email.=================');
                      //   } else if (e.code == 'wrong-password') {
                      //     print('==================Wrong password provided for that user.=============');
                      //     }
                          }

                          
                }
               },),
              
              SizedBox(height: 20,),
          
              InkWell(
                onTap: ()async{
                  if(email.text==""){
                    AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'تنبيه',
              desc: ' الرجاء كتابة بريدك الاكتروني اولا',
              ).show();

              return;
                  }
                 try {
                   await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                  AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'تنبيه',
              desc: ' الرجاء الذهاب الي بريدك الاكتروني والتحقق من كلمة المرور',
              ).show();
                   
                 } catch (e) {
                  AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'تنبيه',
              desc: ' الرجاء الذهاب الي بريدك الاكتروني والتحقق منه',
              ).show();
                   
                 }
                },
                child: Text("Forgot Password ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),textAlign: TextAlign.center,),
              ),
          
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an account  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SigUP(),));
                      },
                      child: Text("SignUp",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff187870)),textAlign: TextAlign.center,)),
          
                  ],
                )
              ),
          
              SizedBox(height: 20,),
          
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