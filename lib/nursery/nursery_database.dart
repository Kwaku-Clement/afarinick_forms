import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'nursery_model.dart';

class NurseryDatabase {
  static final NurseryDatabase instance =
      NurseryDatabase._init();
  static Database? _database;
  NurseryDatabase._init();

  static const String nurseryTable = 'nursery';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('nursery.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute("""
        CREATE TABLE $nurseryTable (
          _id INTEGER PRIMARY KEY AUTOINCREMENT,
          staff_contact TEXT,
          staff_name TEXT,
          time NOT NULL,
          date_capturing TEXT,
          nursery_name TEXT,
          sector_name TEXT,
          decapitation TEXT,
          watering TEXT,
          mulching TEXT,
          rearrangement TEXT,
          fertilisation TEXT,
          fungicide TEXT,
          insecticide TEXT,
          seedlings TEXT,
          leafcutting TEXT,
          weeding TEXT,
          segment TEXT,
          cluster_id TEXT,
          decapitation_comments TEXT,
          watering_comments TEXT,
          mulching_comments TEXT,
          rearrangement_comments TEXT,
          fertilisation_comments TEXT,
          fungicide_comments TEXT,
          insecticide_comments TEXT,
          seedlings_comments TEXT,
          leafcutting_comments TEXT,
          weeding_comments TEXT,
          observation TEXT
          )""");
  }

  Future<Nursery> create(Nursery harvest) async {
    final db = await instance.database;
    final id = await db.insert(nurseryTable, harvest.toJson());
    return harvest.copy(id: id);
  }

  Future<Nursery> readHarvest({required int id}) async {
    final db = await instance.database;

    final maps = await db.query(
      nurseryTable,
      columns: NurseryFields.values,
      where: '${NurseryFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Nursery.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Nursery>> readAllHarvests() async {
    final db = await instance.database;
    const orderBy = '${NurseryFields.time} ASC';
    final result = await db.query(nurseryTable, orderBy: orderBy);

    return result.map((json) => Nursery.fromJson(json)).toList();
  }

  Future<int> update({required Nursery harvest}) async {
    final db = await instance.database;

    return db.update(
      nurseryTable,
      harvest.toJson(),
      where: '${NurseryFields.id} = ?',
      whereArgs: [harvest.id],
    );
  }

  Future<int> delete({required int id}) async {
    final db = await instance.database;

    return await db.delete(
      nurseryTable,
      where: '${NurseryFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
