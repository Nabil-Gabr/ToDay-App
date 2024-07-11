import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:today/login/login.dart';
import 'package:today/model/task_data.dart';
import 'package:today/screens/add_task.dart';
import 'package:today/widgets/list_view.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, 
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTask((newTaskTitle){
                  // setState(() {
                  //   tasks.add(TaskV(name:newTaskTitle ));
                  // });
                })),
            ),);
        },
        child: Icon(Icons.add,color: Colors.teal[400],),
      ),
      backgroundColor: Colors.teal[400],

      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 60,bottom: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.playlist_add_check,size: 40,color: Colors.black),
                SizedBox(width: 10,),
                Text("ToDayDo",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black),),
                SizedBox(width: 70,),
                MaterialButton(onPressed:()async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LogIN(),), (route) => false);
                },child: Icon(Icons.exit_to_app,size: 40,color: Colors.black),)
              ],
            ),

            const SizedBox(height: 20,),
            Text("${Provider.of<TaskData>(context).tasks.length} Tasks",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
            const SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: ListView_W(),
              ),
            )

          ],
        ),
      ),
    );
  }
}

