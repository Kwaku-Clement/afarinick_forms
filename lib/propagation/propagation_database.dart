import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'propagation_model.dart';

class PropagationDatabase {
  static final PropagationDatabase instance =
      PropagationDatabase._init();
  static Database? _database;
  PropagationDatabase._init();
  static const String propagationTable = 'propagation';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('propagation.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute("""
        CREATE TABLE $propagationTable (
          _id INTEGER PRIMARY KEY AUTOINCREMENT,
          truck_number TEXT,
          source_location TEXT,
          time NOT NULL,
          date_reception TEXT,
          waybill_quantity TEXT,
          suppliers_name TEXT,
          suckers_received TEXT,
          box_code TEXT,
          suckers_pared TEXT,
          standard_sized_corms TEXT,
          bull_head_corms TEXT,
          rejected_corms TEXT,
          corms_buried TEXT,
          boxes_generated TEXT,
          individual_corm_box TEXT,
          undersized_corms TEXT
          )""");
  }

  Future<Propagation> create(Propagation harvest) async {
    final db = await instance.database;
    final id = await db.insert(propagationTable, harvest.toJson());
    return harvest.copy(id: id);
  }

  Future<Propagation> readHarvest({required int id}) async {
    final db = await instance.database;

    final maps = await db.query(
      propagationTable,
      columns: PropagationFields.values,
      where: '${PropagationFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Propagation.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Propagation>> readAllHarvests() async {
    final db = await instance.database;
    const orderBy = '${PropagationFields.time} ASC';
    final result = await db.query(propagationTable, orderBy: orderBy);

    return result.map((json) => Propagation.fromJson(json)).toList();
  }

  Future<int> update({required Propagation harvest}) async {
    final db = await instance.database;

    return db.update(
      propagationTable,
      harvest.toJson(),
      where: '${PropagationFields.id} = ?',
      whereArgs: [harvest.id],
    );
  }

  Future<int> delete({required int id}) async {
    final db = await instance.database;

    return await db.delete(
      propagationTable,
      where: '${PropagationFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
