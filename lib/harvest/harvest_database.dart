import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'harvest_model.dart';

class HarvestingDatabase {
  static final HarvestingDatabase instance =
      HarvestingDatabase._init();
  static Database? _database;
  HarvestingDatabase._init();

  static const harvestTable = 'harvests';
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('harvests.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute("""
        CREATE TABLE $harvestTable (
          _id INTEGER PRIMARY KEY AUTOINCREMENT, 
          harvested TEXT, 
          comment TEXT, 
          time NOT NULL,
          soil_sawdust TEXT, 
          nursery_bags_requested TEXT, 
          nursery_bags_filled TEXT, 
          clusters_arranged TEXT,
          box_code TEXT, 
          loss_quantity TEXT, 
          sand_sawdust TEXT, 
          transplanted_cluster_code TEXT,
          seedlings_cluster TEXT
          )""");
  }

  Future<Harvest> create(Harvest harvest) async {
    final db = await instance.database;
    final id = await db.insert(harvestTable, harvest.toJson());
    return harvest.copy(id: id);
  }

  Future<Harvest> readHarvest({required int id}) async {
    final db = await instance.database;

    final maps = await db.query(
      harvestTable,
      columns: HarvestFields.values,
      where: '${HarvestFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Harvest.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Harvest>> readAllHarvests() async {
    final db = await instance.database;
    const orderBy = '${HarvestFields.time} ASC';
    final result = await db.query(harvestTable, orderBy: orderBy);

    return result.map((json) => Harvest.fromJson(json)).toList();
  }

  Future<int> update({required Harvest harvest}) async {
    final db = await instance.database;

    return db.update(
      harvestTable,
      harvest.toJson(),
      where: '${HarvestFields.id} = ?',
      whereArgs: [harvest.id],
    );
  }

  Future<int> delete({required int id}) async {
    final db = await instance.database;

    return await db.delete(
      harvestTable,
      where: '${HarvestFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
