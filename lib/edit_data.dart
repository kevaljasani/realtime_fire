import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class third extends StatefulWidget {
  const third({super.key});

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {

  TextEditingController name=TextEditingController();
  TextEditingController contact=TextEditingController();
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: Column(
        children: [

          TextField(
            controller: name,

            decoration: InputDecoration(
                label: Text("Enter Name")
            ),
          ),

          TextField(
            controller: contact,

            decoration: InputDecoration(
                label: Text("Enter Contact")
            ),
          ),

          TextField(
            controller: t1,

            decoration: InputDecoration(
                label: Text("Enter S1")
            ),
          ),

          TextField(
            controller: t2,

            decoration: InputDecoration(
                label: Text("Enter S2")
            ),
          ),

          TextField(
            controller: t3,

            decoration: InputDecoration(
                label: Text("Enter S3")
            ),
          ),

          ElevatedButton(onPressed: () async {

            DatabaseReference ref = FirebaseDatabase.instance.ref("student").push();

            await ref.set({
              "name": "${name.text}",
              "contact": "${contact.text}",
              "marks": {
                "s1": "${t1.text}",
                "s2": "${t2.text}",
                "s3": "${t3.text}",
              }
            });

            name.text="";
            contact.text="";
            t1.text="";
            t2.text="";
            t3.text="";


          }, child: Text("ADD")),

          ElevatedButton(onPressed: () {

          }, child: Text("View"))
        ],
      ),




    );
  }
}
