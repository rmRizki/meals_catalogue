import 'dart:async';
import 'dart:io' as io;
import 'package:meals_catalogue/model/data_meals_detail.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  DBHelper.internal();
  factory DBHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await setDB();
    return _db;
  }

  setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "MealsCatalogueDb");
    var dB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE favorite(id INTEGER PRIMARY KEY AUTOINCREMENT, idMeal TEXT, strMeal TEXT, strMealThumb TEXT, strCategory TEXT)");
  }

  Future<List<MealsProperty>> getFavorite(String category) async {
    var dbClient = await db;
    var res = await dbClient
        .query("favorite", where: "strCategory = ?", whereArgs: [category]);
    List<MealsProperty> data =
        res.map((i) => MealsProperty.fromJson(i)).toList();
    return data;
  }

  Future<bool> checkIsFavorite(String id) async{
    var dbClient = await db;
    var res = await dbClient.query("favorite",where: "idMeal = ?", whereArgs: [id]);
    bool isFavorite = res.isNotEmpty;
    return isFavorite;
  }

  Future<int> deleteFavorite(String id) async {
    var dbClient = await db;
    int res =
        await dbClient.delete("favorite", where: "idMeal = ?", whereArgs: [id]);
    return res;
  }

  Future<int> addFavorite(MealsProperty data) async {
    var dbClient = await db;
    int res = await dbClient.insert("favorite", data.toMap());
    return res;
  }
}
