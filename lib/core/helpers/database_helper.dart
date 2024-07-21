import 'package:beyond_the_stars/features/saved_items/data/models/saved_item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Database? _db;

  static const String databaseName = "saved_items.db";
  static const String tableName = "saved";

  get db async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), databaseName);
      _db = await openDatabase(path,
          version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
      return _db;
    }
    return _db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        type TEXT NOT NULL,
        image TEXT NOT NULL,
        location TEXT NOT NULL
        )
''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('drop table $tableName');
    await _onCreate(db, newVersion);
  }

  Future<SavedItemModel> saveItem(SavedItemModel item) async {
    Database database = await db;
    int id = await database.insert(tableName, item.toJson());
    item.id = id;
    return item;
  }

  Future<List<SavedItemModel>> getSavedItems() async {
    Database database = await db;
    List<Map<String, dynamic>> savedItems = await database.query(
      tableName,
    );

    List<SavedItemModel> allItems = [];
    if (savedItems.isNotEmpty) {
      for (var item in savedItems) {
        // print(SavedItemModel.fromJson(item));
        print(item);
        allItems.add(SavedItemModel.fromJson(item));
      }
    }
    return allItems;
  }

  Future<bool> isSaved(String itemTitle) async {
    Database database = await db;
    List<Map<String, dynamic>> items = await database.query(
      tableName,
      where: "title = ?",
      whereArgs: [itemTitle],
    );
    return items.isNotEmpty;
  }

  Future<int> delete(String itemTitle) async {
    Database database = await db;
    return await database
        .delete(tableName, where: "title=?", whereArgs: [itemTitle]);
  }
}
