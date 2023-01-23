import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:school_app_22/local_database/sqflite_db.dart';
import 'package:school_app_22/screens/home.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  Sql sqlDb = Sql();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add new notes")),
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
                      decoration: InputDecoration(hintText: "note"),
                      controller: note,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "title"),
                      controller: title,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "color"),
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
                          INSERT INTO notes ('note' , 'title' , 'color')
                          VALUES ("${(note.text)}" , "${(title.text)}" , "${(color.text)}")
                          ''');
                        if (response > 0) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: ((context) => Home())),
                              (route) => false);
                        }
                      },
                      child: Text("Add That note"),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
