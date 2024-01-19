import 'package:http/http.dart' as htpp;

import 'nursery_database.dart';
import 'nursery_model.dart';

class SyncNursery {
  final conn = NurseryDatabase.instance;

  Future<List<Nursery>> fetchAllInfo()async{
    final dbClient = await conn.database;
    List<Nursery> nurseryList = [];
    try {
      final maps = await dbClient.query(NurseryDatabase.nurseryTable);
      for (var item in maps) {
        nurseryList.add(Nursery.fromJson(item));
      }
    } catch (e) {
      print(e.toString());
    }
    return nurseryList;
  }

  Future saveToMysqlWith(List<Nursery> nurseryList)async{
    for (var i = 0; i < nurseryList.length; i++) {
      Map<String, dynamic> data = {
        "_id":nurseryList[i].id.toString(),
        "time":nurseryList[i].createdTime.toString(),
        "staff_contact":nurseryList[i].staff_contact,
        "staff_name":nurseryList[i].staff_name,
        "date_capturing":nurseryList[i].date_capturing,
        "nursery_name":nurseryList[i].nursery_name,
        "sector_name":nurseryList[i].sector_name,
        "decapitation":nurseryList[i].decapitation,
        "watering":nurseryList[i].watering,
        "mulching":nurseryList[i].mulching,
        "rearrangement":nurseryList[i].rearrangement,
        "fertilisation":nurseryList[i].fertilisation,
        "fungicide":nurseryList[i].fungicide,
        "insecticide":nurseryList[i].insecticide,
        "seedlings":nurseryList[i].seedlings,
        "leafcutting":nurseryList[i].leafcutting,
        "weeding":nurseryList[i].weeding,
        "segment":nurseryList[i].segment,
        "cluster_id":nurseryList[i].cluster_id,
        "decapitation_comments":nurseryList[i].decapitation_comments,
        "watering_comments":nurseryList[i].watering_comments,
        "mulching_comments":nurseryList[i].mulching_comments,
        "rearrangement_comments":nurseryList[i].rearrangement_comments,
        "fertilisation_comments":nurseryList[i].fertilisation_comments,
        "fungicide_comments":nurseryList[i].fungicide_comments,
        "insecticide_comments":nurseryList[i].insecticide_comments,
        "seedlings_comments":nurseryList[i].seedlings_comments,
        "leafcutting_comments":nurseryList[i].leafcutting_comments,
        "weeding_comments":nurseryList[i].weeding_comments,
        "observation":nurseryList[i].observation,
      };
      final response = await htpp.post(Uri.parse('http://192.168.43.6/syncsqftomysqlflutter/load_from_sqflite_contactinfo_table_save_or_update_to_mysql.php'),body: data);
      if (response.statusCode==200) {
      }else{
      }
    }
  }

  Future<List> fetchAllNursery()async{
    final dbClient = await conn.database;
    List nurseryList = [];
    try {
      final maps = await dbClient.query(NurseryDatabase.nurseryTable);
      for (var item in maps) {
        nurseryList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return nurseryList;
  }

  Future saveToMysql(List nurseryList)async{
    for (var i = 0; i < nurseryList.length; i++) {
      Map<String, dynamic> data = {
        "_id":nurseryList[i]['_id'].toString(),
        "staff_contact":nurseryList[i]['staff_contact'],
        "staff_name":nurseryList[i]['staff_name'],
        "date_capturing":nurseryList[i]['date_capturing'],
        "nursery_name":nurseryList[i]['nursery_name'],
        "sector_name":nurseryList[i]['sector_name'],
        "decapitation":nurseryList[i]['decapitation'],
        "watering":nurseryList[i]['watering'],
        "mulching":nurseryList[i]['mulching'],
        "rearrangement":nurseryList[i]['rearrangement'],
        "fertilisation":nurseryList[i]['fertilisation'],
        "fungicide":nurseryList[i]['fungicide'],
        "time":nurseryList[i]['createdTime'],
        "insecticide":nurseryList[i]['insecticide'],
        "seedlings":nurseryList[i]['seedlings'],
        "leafcutting":nurseryList[i]['leafcutting'],
        "weeding":nurseryList[i]['weeding'],
        "segment":nurseryList[i]['segment'],
        "cluster_id":nurseryList[i]['cluster_id'],
        "decapitation_comments":nurseryList[i]['decapitation_comments'],
        "watering_comments":nurseryList[i]['watering_comments'],
        "mulching_comments":nurseryList[i]['mulching_comments'],
        "rearrangement_comments":nurseryList[i]['rearrangement_comments'],
        "fertilisation_comments":nurseryList[i]['fertilisation_comments'],
        "fungicide_comments":nurseryList[i]['fungicide_comments'],
        "insecticide_comments":nurseryList[i]['insecticide_comments'],
        "seedlings_comments":nurseryList[i]['seedlings_comments'],
        "leafcutting_comments":nurseryList[i]['leafcutting_comments'],
        "weeding_comments":nurseryList[i]['weeding_comments'],
        "observation":nurseryList[i]['observation'],
      };
      final response = await htpp.post(Uri.parse('http://192.168.43.6/syncsqftomysqlflutter/load_from_sqflite_contactinfo_table_save_or_update_to_mysql.php'),body: data);
      if (response.statusCode==200) {
      }else{
        print(response.statusCode);
      }
    }
  }

}