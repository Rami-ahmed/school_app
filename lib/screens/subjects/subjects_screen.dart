import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:school_app_22/local_database/sqflite_db.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  Sql sqlDb = Sql();
  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM subjects");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("subjects page ")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addsubject");
        },
        child: Icon(Icons.add),
      ),
      body: Container(
          child: ListView(
        children: [
          FutureBuilder(
            future: readData(),
            builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Card(
                        child: ListTile(
                          title: Text("${snapshot.data![i]['name']}"),
                          subtitle: Text("${snapshot.data![i]['teacher']}"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          MaterialButton(
            onPressed: () async {
              await sqlDb.deletSchoolDatabase();
            },
            child: Text("Delet School Database"),
          ),
        ],
      )),
    );
  }
}
