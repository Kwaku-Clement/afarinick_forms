import 'package:afarinick_forms/propagation/propagation_database.dart';
import 'package:afarinick_forms/propagation/propagation_model.dart';

import 'package:http/http.dart' as http;

class SyncPropagation {

  final conn = PropagationDatabase.instance;

  Future<List<Propagation>> fetchAllInfo()async{
    final dbClient = await conn.database;
    List<Propagation> contactList = [];
    try {
      final maps = await dbClient.query(PropagationDatabase.propagationTable);
      for (var item in maps) {
        contactList.add(Propagation.fromJson(item));
      }
    } catch (e) {
      print(e.toString());
    }
    return contactList;
  }

  Future saveToMysqlWith(List<Propagation> propagationList)async{
    for (var i = 0; i < propagationList.length; i++) {
      Map<String, dynamic> data = {
        "_id":propagationList[i].id.toString(),
        "time":propagationList[i].createdTime.toString(),
        "truck_number":propagationList[i].truck_number,
        "date_reception":propagationList[i].date_reception,
        "waybill_quantity":propagationList[i].waybill_quantity,
        "suppliers_name":propagationList[i].suppliers_name,
        "suckers_received":propagationList[i].suckers_received,
        "suckers_pared":propagationList[i].suckers_pared,
        "standard_sized_corms":propagationList[i].standard_sized_corms,
        "box_code":propagationList[i].box_code,
        "bull_head_corms":propagationList[i].bull_head_corms,
        "rejected_corms":propagationList[i].rejected_corms,
        "boxes_generated":propagationList[i].boxes_generated,
        "source_location":propagationList[i].source_location,
        "corms_buried":propagationList[i].corms_buried,
        "individual_corm_boxindividual_corm_box":propagationList[i].individual_corm_box,
        "undersized_corms":propagationList[i].undersized_corms,
      };
      final response = await http.post(Uri.parse('http://192.168.43.6/syncsqftomysqlflutter/load_from_sqflite_contactinfo_table_save_or_update_to_mysql.php'),body: data);
      // if (response.statusCode==200) {
      // }else{
      // }
    }
  }

  Future<List> fetchAllPropagation()async{
    final dbClient = await conn.database;
    List propagationList = [];
    try {
      final maps = await dbClient.query(PropagationDatabase.propagationTable);
      for (var item in maps) {
        propagationList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return propagationList;
  }

  Future saveToMysql(List propagationList)async{
    for (var i = 0; i < propagationList.length; i++) {
      Map<String, dynamic> data = {
        "_id":propagationList[i]['_id'].toString(),
        "truck_number":propagationList[i]['truck_number'],
        "date_reception":propagationList[i]['date_reception'],
        "waybill_quantity":propagationList[i]['waybill_quantity'],
        "suppliers_name":propagationList[i]['suppliers_name'],
        "suckers_received":propagationList[i]['suckers_received'],
        "suckers_pared":propagationList[i]['suckers_pared'],
        "standard_sized_corms":propagationList[i]['standard_sized_corms'],
        "box_code":propagationList[i]['box_code'],
        "bull_head_corms":propagationList[i]['bull_head_corms'],
        "rejected_corms":propagationList[i]['rejected_corms'],
        "boxes_generated":propagationList[i]['boxes_generated'],
        "source_location":propagationList[i]['source_location'],
        "corms_buried":propagationList[i]['corms_buried'],
        "individual_corm_box":propagationList[i]['gender'],
        "undersized_corms":propagationList[i]['undersized_corms'],
      };
      final response = await http.post(Uri.parse('http://192.168.43.6/syncsqftomysqlflutter/load_from_sqflite_contactinfo_table_save_or_update_to_mysql.php'),body: data);
      if (response.statusCode==200) {
      }else{
        print(response.statusCode);
      }
    }
  }

}