import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:today/login/login.dart';
import 'package:today/model/task_data.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:today/screens/homepage.dart';





void main()async  {
  // ndkVersion flutter.ndkVersion

   
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   
  );

  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('=================User is currently signed out!=================');
    } else {
      print('====================User is signed in!=========================');
    }
  });
  runApp(  MyApp());
}

class DefaultFirebaseOptions {
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>TaskData() ,
      child: MaterialApp(
      home: (FirebaseAuth.instance.currentUser !=null&& FirebaseAuth.instance.currentUser!.emailVerified) ?   HomePage(): const LogIN(),
    ),
      
    );
  }
}

