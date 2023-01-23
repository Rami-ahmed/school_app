import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_app_22/local_database/sqflite_db.dart';
import 'package:school_app_22/screens/home.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({super.key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  Sql sqlDb = Sql();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add new students")),
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
                          INSERT INTO teachers ('name' , 'class' , 'address')
                          VALUES ("${(note.text)}" , "${(title.text)}" , "${(color.text)}")
                          ''');
                        if (response > 0) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: ((context) => Home())),
                              (route) => false);
                        }
                      },
                      child: Text("Add That students"),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
