import 'package:bitpay/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

List<Map<String, dynamic>> contactsData = [
  {
    "id": "1",
    "firstname": "johny",
    "lastname": "Chimpo",
    "profileImage":
        "https://media.gettyimages.com/photos/closeup-of-smiling-businesswoman-wearing-wireless-headphones-against-picture-id1277173765?s=2048x2048",
  },
  {
    "id": "2",
    "firstname": "Gail",
    "lastname": "Mcnett",
    "profileImage":
        "https://media.gettyimages.com/photos/closeup-portrait-of-confident-young-businessman-picture-id1065402040?s=2048x2048",
  },
  {
    "id": "3",
    "firstname": "Vanessa",
    "lastname": "Kopp",
    "profileImage":
        "https://media.gettyimages.com/photos/closeup-headshot-of-a-young-woman-wearing-a-suit-picture-id1280300948?s=2048x2048",
  },
  {
    "id": "4",
    "firstname": "Delores",
    "lastname": "Rathbun",
    "profileImage":
        "https://media.gettyimages.com/photos/closeup-smiling-male-leader-wearing-eyeglasses-picture-id1179627340?s=2048x2048",
  },
  {
    "id": "5",
    "firstname": "Rochel",
    "lastname": "Deshong",
    "profileImage":
        "https://media.gettyimages.com/photos/closeup-of-confident-female-professional-with-blond-hair-in-home-picture-id1277166836?s=2048x2048",
  },
  {
    "id": "6",
    "firstname": "Turuk",
    "lastname": "Macto",
    "profileImage":
        "https://media.gettyimages.com/photos/close-up-portrait-of-young-and-confident-office-employee-picture-id1308903369?s=2048x2048",
  },
];

class DatabaseConnectionProvider with ChangeNotifier {
  DatabaseConnectionProvider() {
    setDatabase();
  }

  List<Map<String, dynamic>> data = [];

  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'contact_db_sqflite');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;

  }

  ///Create Database
  _onCreatingDatabase(Database database, int version) async {
    await database.execute("CREATE TABLE contacts(id INTEGER, firstname TEXT, "
        "lastname TEXT, profileImage TEXT)");
    print("db created!");
  }

  ///Insert data into the database
  insertDatabase(List<Map<String, dynamic>> value) async {
    Database db = await setDatabase();
    value.forEach((element) async {
      db.rawInsert(
          'INSERT INTO contacts(id, firstname, lastname, profileImage)'
          ' VALUES("${element["id"]}", "${element["firstname"]}", "${element["lastname"]}", "${element["profileImage"]}")');
      return;
    });
  }

  ///Select Data from table
  Future<List<Map<String, dynamic>>?> getData() async {
    Database db = await setDatabase();
    data = await db.query("contacts");
    print('data from table$data');
    return data;
  }


}
