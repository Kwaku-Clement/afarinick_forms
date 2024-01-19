import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

// Define a model class for the data
class Data {
  final int id;
  final String name;
  final String content;

  Data({required this.id, required this.name, required this.content});

  // Convert a Data object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'content': content,
    };
  }

  // Convert a Map object into a Data object
  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'],
      name: map['name'],
      content: map['content'],
    );
  }
}

// Define a helper class for the database operations
class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._();

  // A private constructor. Allows us to create instances of DatabaseHelper
  // only from within the DatabaseHelper class itself.
  DatabaseHelper._();

  // Singleton accessor
  static DatabaseHelper get instance => _instance;

  // Database object
  static Database? _database;

  // Database name
  static const String _databaseName = 'data.db';

  // Table name
  static const String _tableName = 'data';

  // Column names
  static const String _columnId = 'id';
  static const String _columnName = 'name';
  static const String _columnContent = 'content';

  // Get the database object
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  _initDatabase() async {
    // Get the database path
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + _databaseName;

    // Open the database
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_tableName (
            $_columnId INTEGER PRIMARY KEY,
            $_columnName TEXT NOT NULL,
            $_columnContent TEXT NOT NULL
          )
          ''');
  }

  // Insert a Data object into the database
  Future<int> insert(Data data) async {
    Database db = await database;
    return await db.insert(_tableName, data.toMap());
  }

  // Update a Data object in the database
  Future<int> update(Data data) async {
    Database db = await database;
    return await db.update(_tableName, data.toMap(),
        where: '$_columnId = ?', whereArgs: [data.id]);
  }

  // Delete a Data object from the database
  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete(_tableName, where: '$_columnId = ?', whereArgs: [id]);
  }

  // Get all Data objects from the database
  Future<List<Data>> getAll() async {
    Database db = await database;
    List<Map> maps = await db.query(_tableName);
    return maps.map((map) => Data.fromMap(map as Map<String, dynamic>)).toList();
  }

  // Get a Data object by id from the database
  Future<Data?> getById(int id) async {
    Database db = await database;
    List<Map> maps =
    await db.query(_tableName, where: '$_columnId = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return Data.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }

  // Sync the local data with the online database
  Future<void> sync() async {
    // Get the local data
    List<Data> localData = await getAll();

    // Get the online data
    var response = await http.get(Uri.parse('https://example.com/api/data'));
    List<Data> onlineData =
    (response.body as List).map((map) => Data.fromMap(map)).toList();

    // Compare the local and online data and perform the necessary operations
    for (var data in localData) {
      // If the local data is not in the online data, delete it from the local database
      if (!onlineData.contains(data)) {
        delete(data.id);
      }
    }

    for (var data in onlineData) {
      // If the online data is not in the local data, insert it into the local database
      if (!localData.contains(data)) {
        insert(data);
      } else {
        // If the online data is in the local data, check if they are different
        var local = localData.firstWhere((element) => element.id == data.id);
        if (local.name != data.name || local.content != data.content) {
          // If they are different, update the local data with the online data
          update(data);
        }
      }
    }
  }
}

// Define a widget to display the data
class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  // A list of Data objects to display
  List<Data> _data = [];

  // A flag to indicate if the data is loading
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    // Load the data from the database
    _loadData();
  }

  // Load the data from the database
  _loadData() async {
    // Set the loading flag to true
    setState(() {
      _loading = true;
    });

    // Get the data from the database
    List<Data> data = await DatabaseHelper.instance.getAll();

    // Set the data and the loading flag
    setState(() {
      _data = data;
      _loading = false;
    });
  }

  // Sync the data with the online database
  _syncData() async {
    // Set the loading flag to true
    setState(() {
      _loading = true;
    });

    // Sync the data with the online database
    await DatabaseHelper.instance.sync();

    // Reload the data from the database
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter sqflite example'),
        actions: [
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: _syncData,
          ),
        ],
      ),
      body: _loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_data[index].name),
            subtitle: Text(_data[index].content),
          );
        },
      ),
    );
  }
}

// Define the main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataList(),
    );
  }
}

// Run the app
void main() async {
  // Initialize the database
  await DatabaseHelper.instance.database;

  // Run the app
  runApp(MyApp());
}
