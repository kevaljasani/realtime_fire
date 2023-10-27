import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_fire/view_data.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MaterialApp(home: first(),));
}

class first extends StatefulWidget {

  String ? id;
  Map ? m;
  first([this.id,this.m]);


  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  
  TextEditingController name=TextEditingController();
  TextEditingController contact=TextEditingController();
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();

  @override
  void initState() {

    if(widget.m != null)
      {
        name.text=widget.m!["name"];
        contact.text=widget.m!["contact"];
        t1.text=widget.m!["Marks"]["s1"];
        t2.text=widget.m!["Marks"]["s2"];
        t3.text=widget.m!["Marks"]["s3"];
      }
    else
      {

      }
  }

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

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return second();
            },));

          }, child: Text("View"))
        ],
      ),

    );
  }
}
