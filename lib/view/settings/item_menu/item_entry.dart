import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../controller/controller.dart';
import '../../../controller/drawer.dart';
import '../../../model/fooddata.dart';


class Item_entry extends StatefulWidget {
  const Item_entry({Key? key}) : super(key: key);

  @override
  State<Item_entry> createState() => _Item_entryState();
}

class _Item_entryState extends State<Item_entry> {
  bool isallFoods = true;
  bool isaddFoods = false;
  bool iseditFoods = false;

  String xcitem = '0';
  String xsubcat = '0';
  String xitem = '4';
  String xalias = '0';
  String xdesc = '0';
  String xunit = '0';
  String xdisctype = '0';
  String xdisc = '0';
  String xvatcat = '';
  String hscode = '0';
  String xhscode = '0';
  String xcost = '0';
  String xrate = '0';
  String xvatrate = '0';
  String xsupptaxrate = '0';
  String xsdcat = '0';
  String xdealerp = '0';

  String xbimage = 'dummy';
  String xsetmenustatus = '0';
  String xshopno = 'OSL--0001';
  String xsupptaxamt = '0';
  String xtype = 'Product';
  String xtypeitem = '0';
  String xvatamt = '0';
  String zauserid = 'fromapp';
  String zuuserid = 'fromapp';

  bool is_select = false;

  // add_item() async {
  //   var response = await http.post(
  //       Uri.parse('http://172.20.20.69/mobilepos/food_create.php'),
  //       body: Encode(<String, String>{
  //         "xitem": xitem,
  //         "xbimage": xbimage,
  //         "xcitem": xcitem,
  //         "xdesc": xdesc,
  //         "xdisc": xdisc,
  //         "xdisctype": xdisctype,
  //         "xhscode": xhscode,
  //         "xrate": xrate,
  //         "xsdcat": xsdcat,
  //         "xsetmenustatus": xsetmenustatus,
  //         "xshopno": xshopno,
  //         "xsubcat": xsubcat,
  //         "xsupptaxrate": xsupptaxrate,
  //         "xtype": xtype,
  //         "xtypeitem": xtypeitem,
  //         "xunit": xunit,
  //         "xvatrate": xvatrate,
  //         "xvatcat": xvatcat,
  //         "zactive": "1",
  //         "zauserid": zauserid,
  //         "zid": "100000",
  //         "zuuserid": zuuserid
  //       }));
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Color(0xff403B35),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xffFAFAFA),
          title: Text(
            "ADD ITEM",
            style: GoogleFonts.lato(
                color: Color(0xff403B35),
                fontSize: size.height / 35,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        drawer: Drawer_page(),
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xitem = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      // for below version 2 use this
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Item Code",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.category,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xcitem = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Category",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.category,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xsubcat = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Sub Category",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.category,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xhscode = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Short Code",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.category,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xdesc = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Food Name",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.restaurant,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xunit = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Unit of Measurement",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.restaurant,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xdisctype = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Discount Type",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.restaurant,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xdisc = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      // for below version 2 use this
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Discount",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.restaurant,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xvatcat = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Vat Category",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.restaurant,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xcost = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      // for below version 2 use this
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Purchase Price",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.restaurant,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xrate = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      // for below version 2 use this
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Sales Price",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.restaurant,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      // for below version 2 use this
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xvatrate = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "Vat(%)",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.price_check,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      // for below version 2 use this
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xsupptaxrate = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "SD(%)",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.price_change,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    onChanged: (input) {
                      xsdcat = input;
                    },
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Empty";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20), // add padding to adjust text
                      isDense: false,

                      labelText: "SD Category",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      // suffixIcon: Icon(
                      //   Icons.price_change,
                      //   size: 35,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 40, left: 40),
                  child: GestureDetector(
                    onTap: () async{
                      var range = new Random();
                      var itemnumber = range.nextInt(900000) + 100000;
                      print(itemnumber);
                      print("object");
                      // add_item();
                      ItemInfoModel item_add_model = ItemInfoModel(
                        xitem: "OSL-$itemnumber",
                        xbimage: "xbimage",
                        xcitem: xcitem,
                        xdesc: xdesc,
                        xdisc: xdisc,
                        xdisctype: "xdisctype",
                        xhscode: "xhscode",
                        xrate: xrate,
                        xsdcat: xsdcat,
                        xsetmenustatus: "xsetmenustatus",
                        xshopno: "xshopno",
                        xsubcat: "xsubcat",
                        xsupptaxamt: xsupptaxrate,
                        xsupptaxrate: xsupptaxrate,
                        xtype: xtype,
                        xtypeitem: xtypeitem,
                        xunit: xunit,
                        xvatamt: xvatamt,
                        xvatcat: xvatcat,
                        xvatrate: xvatrate,
                        zactive: "1",
                        zauserid: "zauserid",
                        zid: 10000,
                        zuuserid: "zuuserid",
                      );
                      await Controller().addDatatToItems(item_add_model).then((value){
                        if (value>0) {
                          print("Success");
                        }else{
                          print("Failed");
                        }

                      });
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xffEC7906),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "ADD ITEM",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
