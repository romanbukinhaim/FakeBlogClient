import 'dart:io';
import 'package:FakeBlogClient/utils/constant.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path_to_db = path.join(documentsDirectory.path, DB_NAME);
    return await openDatabase(path_to_db, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(CREATE_POST_TABLES);
      await db.execute(CREATE_COMMENT_TABLE);
      print("DB created!");
    });
  }

  Future<List<Map<String, dynamic>>> getAllPosts() async {
    final db = await database;
    return await db.query(POST_TABLE_NAME);
  }

  Future<List<Map<String, dynamic>>> getAllPostComments(int post_id) async {
    final db = await database;
    return await db.query(COMMENT_TABLE_NAME, where: "postId = $post_id");
  }

  Future<int> insertPost(Map<String, dynamic> post) async {
    final db = await database;
    return await db.insert(POST_TABLE_NAME, post, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertComment(Map<String, dynamic> comment) async {
    final db = await database;
    return await db.insert(COMMENT_TABLE_NAME, comment, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
