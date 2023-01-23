import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sql {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'school.db');
    Database myDb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 2,
      onUpgrade: _onUpgrade,
    );
    return myDb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    print("on Upgrade __---__---_---__---__---_--");
    // await db.execute("ALTER TABLE 'notes' ADD COLUMN color TEXT");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
CREATE TABLE "students" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
  "name" TEXT NOT NULL ,
  "birthday" TEXT NOT NULL ,
  "address" TEXT NOT NULL ,
  "picture" TEXT NOT NULL ,
  "class" TEXT NOT NULL 
)
''');
    batch.execute('''
CREATE TABLE "teachers" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
  "name" TEXT NOT NULL ,
  "birthday" TEXT NOT NULL ,
  "address" TEXT NOT NULL
)
''');
    batch.execute('''
CREATE TABLE "subjects" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
  "name" TEXT NOT NULL ,
  "teacher" TEXT NOT NULL 
)
''');
    batch.execute('''
CREATE TABLE "markers" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
  "student" TEXT NOT NULL ,
  "marker" TEXT NOT NULL ,
  "subject" TEXT NOT NULL
)
''');
    batch.execute('''
CREATE TABLE "classes" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
  "name" TEXT NOT NULL ,
)
''');
    await batch.commit();

    print(" on Create Database an tables*_*_*_*_*");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  deletSchoolDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'school.db');
    await deleteDatabase(path);
  }
}
