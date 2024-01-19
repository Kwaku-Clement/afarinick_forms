import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

class Synchronization{
  static Future<bool> isInternet()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      if (await DataConnectionChecker().hasConnection) {
        return true;
      }else{
        return false;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if (await DataConnectionChecker().hasConnection) {
        return true;
      }else{
        return false;
      }
    }else {
      return false;
    }
  }

}