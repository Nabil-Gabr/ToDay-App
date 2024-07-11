

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/model/task_data.dart';

//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class AddTask extends StatelessWidget {
  TextEditingController n=TextEditingController();
  final Function addTaskCallback;
   AddTask(this.addTaskCallback);
   GlobalKey<FormState> formState=GlobalKey();
  // final TextEditingController mycontroller;

  // // Create a CollectionReference called users that references the firestore collection
  // CollectionReference users = FirebaseFirestore.instance.collection('users');
    

  //   Future addUser() {
      
  //     // Call the user's CollectionReference to add a new user
  //     return users
  //         .add({"newTaskTitle":n.text})
  //         .then((value) => print("User Added"))
  //         .catchError((error) => print("Failed to add user: $error"));
  //   }



  
 

  @override
  Widget build(BuildContext context) {
     String? newTaskTitle;
    return  Container(
      
      padding: EdgeInsets.all(30),
      child: Form(
        key: formState,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
            Text("Add Task",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black,),),
            SizedBox(height: 10,),
            TextField(
              controller: n,
              onChanged: (newText){
                newTaskTitle=newText;
              },
              // controller: ,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal[400],
                
              ),
              onPressed: (){
                // addUser();
                Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle!);
                Navigator.pop(context);
              }, 
              child: const Text("Add",style: TextStyle(color: Colors.black,fontSize: 30),)),
          ],
        ),
      ),
    );
  }
}
