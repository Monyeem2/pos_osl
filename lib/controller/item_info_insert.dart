
import 'dart:convert';


import 'package:http/http.dart' as http;

import '../database/db_helper.dart';
import '../model/fooddata.dart';


class ItemInsertApiProvider {
  Future<List<Null>> getAllItem() async {

    var response = await http.post(Uri.parse('http://172.20.20.69/mobilepos/food_data.php'),
      body:jsonEncode(<String,String>{
        "zid":"100000",
      }),
    );

    return (json.decode(response.body) as List).map((item) {
      print('Inserting $item');

      SqfliteDatabaseHelper().insertItem(ItemInfoModel.fromJson(item));
    }).toList();
  }

}