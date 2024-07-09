
import 'package:path/path.dart';
import 'package:smartpaymobile/models/user.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteService {
  late Database _db;
  bool hasInitialized = false;

  SQLiteService() {
      initializeDB().then((value){
        _db = value;
        hasInitialized = true;
      });
  }

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
        join(path, 'smartpay.db'),
        onCreate: (db, version) async {
          await db.execute("CREATE TABLE User(id TEXT PRIMARY KEY, name TEXT, "
              "email TEXT, country TEXT, phone TEXT, username TEXT, avatar TEXT)");
          await db.execute("CREATE TABLE UserToken(token TEXT)");
          await db.execute("CREATE TABLE OnBoarding(onBoarded BOOLEAN)");
          await db.execute("CREATE TABLE UserPin(pin TEXT)");
        },
        version: 1
    );
  }

  Future<void> saveUser(User user) async {
    try {
      if(!hasInitialized) {
        await initializeDB();
      }
        await _db.insert(
            'User',
            user.toJson(),
            conflictAlgorithm: ConflictAlgorithm.ignore
        );
    }
    catch(e) {
      print('===========> Fail to save User: $e');
    }
  }

  Future<void> saveToken(String token) async {
    try {
      if(!hasInitialized) {
        await initializeDB();
      }
        await _db.insert(
            'UserToken',
            {'token': token},
            conflictAlgorithm: ConflictAlgorithm.ignore
        );
    }
    catch(e) {
      print('===========> Fail to save Token: $e');
    }
  }

  Future<void> onBoarded(bool boarded) async {
    print('@@@@@@@@@@@@@@@@@@ Saving onboard information...');
    if(!hasInitialized) {
      await initializeDB();
    }
    await _db.insert(
      'OnBoarding',
      {'onBoarded': 1},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> savePIN(String pin) async {
    try {
      if(!hasInitialized) {
        await initializeDB();
      }
      await _db.insert(
          'UserPin',
          {'pin': pin},
          conflictAlgorithm: ConflictAlgorithm.ignore
      );
    }
    catch(e) {
      print('===========> Fail to save pin: $e');
    }
  }

  Future<bool?> isOnBoarded() async {
    if(!hasInitialized) {
      await initializeDB();
    }
    List<Map<String, dynamic>> result = await _db.query('OnBoarding');
    if (result.isNotEmpty) {
      return result.first['onBoarded'] == 1;
    }
    return null;
  }

  Future<User?> getUser() async {
    if(!hasInitialized) {
      await initializeDB();
    }
      final user = await _db.query('User');
      if(user.isNotEmpty) {
        return User.fromJson(user.first);
      }
      else {
        return null;
      }
  }

  Future<String?> getToken() async {
    if(!hasInitialized) {
      await initializeDB();
    }
    List<Map<String, dynamic>> token = await _db.query('UserToken');
      if(token.isNotEmpty) {
        return token.first['token'];
      }
      else {
        return null;
      }
  }

  Future<String?> getPIN() async {
    if(!hasInitialized) {
      await initializeDB();
    }
    List<Map<String, dynamic>> token = await _db.query('UserPin');
    if(token.isNotEmpty) {
      return token.first['pin'];
    }
    else {
      return null;
    }
  }

  Future<void> clearData() async {
    if(!hasInitialized) {
      await initializeDB();
    }
    await _db.transaction((action) async {
      await action.execute('DELETE FROM UserToken');
      await action.execute('DELETE FROM UserPin');
      await action.execute('DELETE FROM User');
    });
  }

}