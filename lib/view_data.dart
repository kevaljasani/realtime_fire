import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtime_fire/main.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  DatabaseReference starCountRef = FirebaseDatabase.instance.ref('student');
  DatabaseReference ref = FirebaseDatabase.instance.ref("student");

  List key=[];
  List val=[];

  Map m={};
  
  // @override
  // void initState() {
  //
  //   starCountRef.onValue.listen((DatabaseEvent event) {
  //     final data = event.snapshot.value;
  //     print(data);
  //
  //
  //     Map m = data as Map;
  //     print(m);
  //
  //     key=m.keys.toList();
  //     val=m.values.toList();
  //
  //     setState(() {
  //
  //     });
  //
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: StreamBuilder(
        stream: starCountRef.onValue,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.active)
            {

              final data = snapshot.data!.snapshot.value;
              
              Map m = data as Map;
              print(m);

                
              key=m.keys.toList();
              val=m.values.toList();
            }

          return ListView.builder(
            itemCount: val.length,
            itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("${val[index]["name"]}"),
                subtitle: Text("${val[index]["contact"]}"),
                trailing: Wrap(
                  children: [
                    
                    ElevatedButton(onPressed: () {

                      DatabaseReference ref = FirebaseDatabase.instance.ref("student").child(key[index]);
                      ref.remove();

                    }, child: Icon(Icons.delete)),
                    
                    ElevatedButton(onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return first(key[index],val[index]);
                      },));

                    }, child: Icon(Icons.edit))
                  ],
                ),
              ),
            );
          },);
      },),
    );
  }
}
