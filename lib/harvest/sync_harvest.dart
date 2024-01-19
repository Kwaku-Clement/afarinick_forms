import 'package:http/http.dart' as htpp;

import 'harvest_database.dart';
import 'harvest_model.dart';

class SyncHarvest {

  final conn = HarvestingDatabase.instance;

  Future<List<Harvest>> fetchAllInfo()async{
    final dbClient = await conn.database;
    List<Harvest> harvestList = [];
    try {
      final maps = await dbClient.query(HarvestingDatabase.harvestTable);
      for (var item in maps) {
        harvestList.add(Harvest.fromJson(item));
      }
    } catch (e) {
    }
    return harvestList;
  }

  Future saveToMysqlWith(List<Harvest> harvestList)async{
    for (var i = 0; i < harvestList.length; i++) {
      Map<String, dynamic> data = {
        "_id":harvestList[i].id.toString(),
        "time":harvestList[i].createdTime.toString(),
        "soil_sawdust":harvestList[i].soil_sawdust,
        "comment":harvestList[i].comment,
        "sand_sawdust":harvestList[i].sand_sawdust,
        "transplanted_cluster_code":harvestList[i].transplanted_cluster_code,
        "nursery_bags_requested":harvestList[i].nursery_bags_requested,
        "nursery_bags_filled":harvestList[i].nursery_bags_filled,
        "clusters_arranged":harvestList[i].clusters_arranged,
        "box_code":harvestList[i].box_code,
        "harvested":harvestList[i].harvested,
        "loss_quantity":harvestList[i].loss_quantity,
        "seedlings_cluster":harvestList[i].seedlings_cluster,
      };
      final response = await htpp.post(Uri.parse('http://192.168.43.6/syncsqftomysqlflutter/load_from_sqflite_contactinfo_table_save_or_update_to_mysql.php'),body: data);
      if (response.statusCode==200) {
      }else{
      }
    }
  }

  Future<List> fetchAllHarvest()async{
    final dbClient = await conn.database;
    List harvestList = [];
    try {
      final maps = await dbClient.query(HarvestingDatabase.harvestTable);
      for (var item in maps) {
        harvestList.add(item);
      }
    } catch (e) {
    }
    return harvestList;
  }

  Future saveToMysql(List harvestList)async{
    for (var i = 0; i < harvestList.length; i++) {
      Map<String, dynamic> data = {
        "_id":harvestList[i]['_id'].toString(),
        "soil_sawdust":harvestList[i]['soil_sawdust'],
        "comment":harvestList[i]['comment'],
        "sand_sawdust":harvestList[i]['sand_sawdust'],
        "transplanted_cluster_code":harvestList[i]['transplanted_cluster_code'],
        "nursery_bags_requested":harvestList[i]['nursery_bags_requested'],
        "nursery_bags_filled":harvestList[i]['nursery_bags_filled'],
        "clusters_arranged":harvestList[i]['clusters_arranged'],
        "box_code":harvestList[i]['box_code'],
        "harvested":harvestList[i]['harvested'],
        "loss_quantity":harvestList[i]['loss_quantity'],
        "seedlings_cluster":harvestList[i]['seedlings_cluster'],
        "time":harvestList[i]['createdTime'],
      };
      final response = await htpp.post(Uri.parse('http://192.168.43.6/syncsqftomysqlflutter/load_from_sqflite_contactinfo_table_save_or_update_to_mysql.php'),body: data);
      if (response.statusCode==200) {
      }else{
        print(response.statusCode);
      }
    }
  }

}