
import 'package:http/http.dart' as http;

import '../database/db_helper.dart';
import '../model/cart_category.dart';
import '../model/fooddata.dart';


class Controller {
  final conn = SqfliteDatabaseHelper.instance;

  // static Future<bool> isInternet() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     if (await DataConnectionChecker().hasConnection) {
  //       print("Mobile data detected & internet connection confirmed.");
  //       return true;
  //     } else {
  //       print('No internet :( Reason:');
  //       return false;
  //     }
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     if (await DataConnectionChecker().hasConnection) {
  //       print("wifi data detected & internet connection confirmed.");
  //       return true;
  //     } else {
  //       print('No internet :( Reason:');
  //       return false;
  //     }
  //   } else {
  //     print(
  //         "Neither mobile data or WIFI detected, not internet connection found.");
  //     return false;
  //   }
  // }

  // Future<int> addData(ContactinfoModel contactinfoModel) async {
  //   var dbclient = await conn.db;
  //   int result;
  //   try {
  //     result = await dbclient.insert(
  //         SqfliteDatabaseHelper.contactinfoTable, contactinfoModel.toJson());
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result;
  // }
  //
  // Future<int> deleteData() async {
  //   var dbclient = await conn.db;
  //   int result;
  //   try {
  //     result = await dbclient.delete(
  //         SqfliteDatabaseHelper.contactinfoTable);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result;
  // }
  //
  // Future<int> updateData(ContactinfoModel contactinfoModel) async {
  //   var dbclient = await conn.db;
  //   int result;
  //   try {
  //     result = await dbclient.update(
  //         SqfliteDatabaseHelper.contactinfoTable, contactinfoModel.toJson(),
  //         where: 'id=?', whereArgs: [contactinfoModel.id]);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result;
  // }

  Future fetchData() async {
    var dbclient = await conn.db;
    List itemList = [];
    try {
      List<Map<String, dynamic>> maps = await dbclient!.query(
          SqfliteDatabaseHelper.productTable, orderBy: 'id DESC');
      for (var item in maps) {
        itemList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return itemList;
  }


  Future fetchcategory() async {
    var dbclient = await conn.db;
    List categoryList = [];
    try {
      List<Map<String, dynamic>> maps = await dbclient!.query(
          SqfliteDatabaseHelper.productTable, groupBy: 'xcitem');
      for (var item in maps) {
        categoryList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return categoryList;
  }



Future<int> addDatatToCart(Cart_add_Model cart_add_model) async {
  var dbclient = await conn.db;
  int result = 0;
  try {
    result = await dbclient!.insert(
        SqfliteDatabaseHelper.cartTable, cart_add_model.toJson());
  } catch (e) {
    print(e.toString());
  }
  return result;
}


  Future fetchData_from_cart() async {
    var dbclient = await conn.db;
    List itemList = [];
    try {
      List<Map<String, dynamic>> maps = await dbclient!.query(
          SqfliteDatabaseHelper.cartTable, orderBy: 'id DESC');
      for (var item in maps) {
        itemList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return itemList;
  }

// Future<int> updateData_from_cart(Cart_add_Model cart_add_model) async {
//   var dbclient = await conn.db;
//   int result= 0;
//   try {
//     result = await dbclient!.update(
//         SqfliteDatabaseHelper.cartTable, cart_add_model.toJson(),
//         where: 'id=?', whereArgs: [cart_add_model.id]);
//   } catch (e) {
//     print(e.toString());
//   }
//   return result;
// }

  Future updateData_from_cart(int product_qnty, double xlineamt, int id) async {
    var dbclient = await conn.db;
    int value = 0;
    value = await dbclient!.rawUpdate('UPDATE ${SqfliteDatabaseHelper.cartTable} SET product_qnty = ?, xlineamt = ? WHERE id = ?', [product_qnty,xlineamt, id]);
    return value;
  }


  Future deleteData_from_cart(int id) async {
    var dbclient = await conn.db;
    int value = 0;
    value = await dbclient!.delete('${SqfliteDatabaseHelper.cartTable}', where: "id = ?", whereArgs: [id]);
    return value;
  }

  Future getTotal_from_cart() async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT SUM(xlineamt) FROM ${SqfliteDatabaseHelper.cartTable}");
    Object? value = result[0]["SUM(xlineamt)"];
    return value.toString();
  }

  Future getnetAmount_from_cart() async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT (SUM(xlineamt) + SUM(xvatamt) - SUM(xdisc)) AS sum FROM ${SqfliteDatabaseHelper.cartTable}");
    print(result);
    Object? value = result[0]["sum"];
    return value.toString();
  }



  Future getDiscount_from_cart() async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT SUM(xdisc) FROM ${SqfliteDatabaseHelper.cartTable}");
    Object? value = result[0]["SUM(xdisc)"];
    print(result);
    return value.toString();
  }

  Future getVat_from_cart() async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT SUM(xvatamt) FROM ${SqfliteDatabaseHelper.cartTable}");
    Object? value = result[0]["SUM(xvatamt)"];
    return value.toString();
  }

  Future getSD_from_cart() async {
    var dbclient = await conn.db;
    var result = await dbclient!.rawQuery("SELECT SUM(xsupptaxamt) FROM ${SqfliteDatabaseHelper.cartTable}");
    Object? value = result[0]["SUM(xsupptaxamt)"];
    return value.toString();
  }

  // Future getService_from_cart() async {
  //   var dbclient = await conn.db;
  //   var result = await dbclient!.rawQuery("SELECT SUM(xlineamt) FROM ${SqfliteDatabaseHelper.cartTable}");
  //   Object? value = result[0]["SUM(xlineamt)"];
  //   return value.toString();
  // }


  Future<int> addDatatToItems(ItemInfoModel item_add_model) async {
    var dbclient = await conn.db;
    int result = 0;
    try {
      result = await dbclient!.insert(
          SqfliteDatabaseHelper.productTable, item_add_model.toJson());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }



}