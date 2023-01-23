import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_app_22/local_database/sqflite_db.dart';
import 'package:school_app_22/screens/home.dart';

class AddMarkers extends StatefulWidget {
  const AddMarkers({super.key});

  @override
  State<AddMarkers> createState() => _AddMarkersState();
}

class _AddMarkersState extends State<AddMarkers> {
  Sql sqlDb = Sql();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add new markers")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: "name"),
                      controller: note,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "address"),
                      controller: title,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "class"),
                      controller: color,
                    ),
                    Container(
                      height: 20.0,
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () async {
                        int response = await sqlDb.insertData('''
                          INSERT INTO markers ('student' , 'marker' , 'subject')
                          VALUES ("${(note.text)}" , "${(title.text)}" , "${(color.text)}")
                          ''');
                        if (response > 0) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: ((context) => Home())),
                              (route) => false);
                        }
                      },
                      child: Text("Add That markers"),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
