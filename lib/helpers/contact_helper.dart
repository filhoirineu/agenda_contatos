import 'package:sqflite/sqflite.dart';

import 'package:sqflite/sqflite.dart';

final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;
  ContactHelper.internal();

  Database _db;

  get db {
    if (_db != null) {
      return _db;
    } else {
      _db = initDb();
    }
  }

  initDb() async {
    final dataBasesPath = await getDatabasesPath();

    final path = join(dataBasesPath, "contacts.db");
  }
}

class Contact {
  int id;
  String name;
  String email;
  String phone;
  String img;

  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
  }

  @override
  String toString() {
    return "Contact(id: $id , name: $name , email: $email , phone: $phone , img: $img)";
  }
}
