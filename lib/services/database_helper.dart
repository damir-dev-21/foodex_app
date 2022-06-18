import 'package:food_app/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get db async => _database ??= await init();

  Future<Database> init() async {
    String dbPath = join(await getDatabasesPath(), 'user.db');
    var database = openDatabase(dbPath, version: 1, onCreate: _onCreateTables);

    return database;
  }

  void _onCreateTables(Database db, int version) {
    db.execute("""
      CREATE TABLE user(
        id INTEGER,
        name TEXT,
        email TEXT,
        password TEXT,
        token TEXT,
        phone_number TEXT
      )
    """);

    print("Tables was created!");
  }

  Future<void> deleteUser() async {
    Database _db = await init();

    await _db.delete('user');
  }

  Future<List<User>> getUser() async {
    var database = await db;
    List<Map<String, dynamic>> userMap = await database.query('user');

    return List.generate(userMap.length, (index) {
      return User(
          id: userMap[index]['id'],
          name: userMap[index]['name'],
          email: userMap[index]['email'],
          password: userMap[index]['password'],
          phone_number: userMap[index]['phone_number'],
          cards: [],
          token: userMap[index]['token'],
          orderList: []);
    });
  }
}
