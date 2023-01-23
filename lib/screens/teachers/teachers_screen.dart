import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:school_app_22/local_database/sqflite_db.dart';

class TeachersScreen extends StatefulWidget {
  const TeachersScreen({super.key});

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  Sql sqlDb = Sql();
  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM teachers");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home page ")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addteacher");
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
                          title: Text("${snapshot.data![i]['note']}"),
                          subtitle: Text("${snapshot.data![i]['title']}"),
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
