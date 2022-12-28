// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import '../controller/controller.dart';
// import '../model/food_category.dart';
// import '../model/fooddata.dart';
//
// class POS extends StatefulWidget {
//   const POS({Key? key}) : super(key: key);
//
//   @override
//   State<POS> createState() => _POSState();
// }
//
// class _POSState extends State<POS> {
//
//   late List list;
//   bool loading = true;
//   Future userList()async{
//     list = await Controller().fetchData();
//     setState(() {loading=false;});
//     //print(list);
//   }
//
//   List categorylist = [
//     'Burger',
//     'Cake',
//     'Drinks',
//     'Pizza',
//     'Sandwich',
//     'Sides'
//   ];
//   List myproductsprice = ['210', '120', '30', '780', '209', '99'];
//
//   late Future<List<ItemInfoModel>> allfood;
//   Future<List<ItemInfoModel>>  all_food() async {
//     var response = await http.post(Uri.parse("http://172.20.20.69/mobilepos/food_data.php"),
//       body:jsonEncode(<String,String>{
//         "zid":"100000",
//       }),
//     );
//     print(response.body);
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed
//           .map<ItemInfoModel>((json) => ItemInfoModel.fromJson(json))
//           .toList();
//
//     } else {
//       throw Exception('Failed to fetch Data');
//     }
//   }
//   late Future<List<FoodCategory>> category;
//   Future<List<FoodCategory>> find_category() async{
//     var response = await http.post(
//         Uri.parse(
//             'http://172.20.20.69/mobilepos/category_fetch.php'),
//         body: jsonEncode(<String, String>{
//           "zid":"100000",
//         }));
//     print(response.body);
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed
//           .map<FoodCategory>((json) => FoodCategory.fromJson(json))
//           .toList();
//     } else {
//       throw Exception('Failed to fetch Data');
//     }
//
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     userList();
//
//     find_category();
//     category=find_category();
//     all_food();
//     allfood=all_food();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xffFAFAFA),
//           title: Text(
//             "POS",
//             style: GoogleFonts.lato(
//                 color: Color(0xff403B35),
//                 fontSize: size.height / 35,
//                 fontWeight: FontWeight.bold),
//           ),
//           centerTitle: true,
//           // leading: GestureDetector(
//           //   child: Icon(
//           //     Icons.menu,
//           //     color: Color(0xff403B35),
//           //   ),
//           //   onTap: () {
//           //     if (scaffoldKey.currentState!.isDrawerOpen) {
//           //       scaffoldKey.currentState!.closeDrawer();
//           //       //close drawer, if drawer is open
//           //     } else {
//           //       scaffoldKey.currentState!.openDrawer();
//           //       //open drawer, if drawer is closed
//           //     }
//           //   },
//           // ),
//           // actions: <Widget>[
//           //   IconButton(
//           //     icon: Icon(
//           //       Icons.logout,
//           //       color: Color(0xff403B35),
//           //     ),
//           //     tooltip: 'Open shopping cart',
//           //     onPressed: () {
//           //       Navigator.pop(context);
//           //     },
//           //   ),
//           // ],
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             height: size.height,
//             width: size.width,
//             padding: EdgeInsets.all(8),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 // Text(
//                 //   "Category",
//                 //   style: TextStyle(
//                 //     fontSize: size.height / 40,
//                 //     fontWeight: FontWeight.bold,
//                 //   ),
//                 // ),
//                 // Container(
//                 //   height: size.height / 15,
//                 //   child: ListView.builder(
//                 //     physics: ClampingScrollPhysics(),
//                 //     shrinkWrap: true,
//                 //     scrollDirection: Axis.horizontal,
//                 //     itemCount: 5,
//                 //     itemBuilder: (BuildContext context, int index) => Padding(
//                 //       padding: const EdgeInsets.only(left: 2.0, right: 2),
//                 //       child: Card(
//                 //         shape: const StadiumBorder(),
//                 //         elevation: 3,
//                 //         shadowColor: Color(0xffF7A037).withOpacity(0.5),
//                 //         child: Padding(
//                 //           padding: const EdgeInsets.all(10.0),
//                 //           child: FittedBox(
//                 //             child: Row(
//                 //               mainAxisAlignment: MainAxisAlignment.center,
//                 //               children: [
//                 //                 Image(
//                 //                   height: size.height / 45,
//                 //                   image: AssetImage(
//                 //                       'images/category/${categorylist[index]}.png'),
//                 //                 ),
//                 //                 // Icon(Icons.local_pizza, color: Color(0xffF7A037),),
//                 //                 Text(
//                 //                   '${categorylist[index]}',
//                 //                   style: TextStyle(
//                 //                     fontSize: 14,
//                 //                     // color: Color(0xffF7A037),
//                 //                   ),
//                 //                 ),
//                 //               ],
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Text(
//                 //   "Items",
//                 //   style: TextStyle(
//                 //     fontSize: size.height / 40,
//                 //     fontWeight: FontWeight.bold,
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: size.height / 1.2,
//                 //   child: GridView.builder(
//                 //       shrinkWrap: true,
//                 //       scrollDirection: Axis.vertical,
//                 //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                 //         maxCrossAxisExtent: size.width / 2,
//                 //         crossAxisSpacing: 10,
//                 //         mainAxisSpacing: 10,
//                 //       ),
//                 //       itemCount: categorylist.length,
//                 //       itemBuilder: (BuildContext ctx, index) {
//                 //         return GestureDetector(
//                 //           onTap: () {
//                 //             // setState(() {
//                 //             //   ordered_name.add(featured[index]);
//                 //             //   ordered_img.add(imagesfeatured[index]);
//                 //             //   ordered_price.add(price[index]);
//                 //             //   totalamt();
//                 //             // });
//                 //           },
//                 //           child: Container(
//                 //               decoration: BoxDecoration(
//                 //                 color: Colors.white,
//                 //                 borderRadius: BorderRadius.circular(15),
//                 //                 boxShadow: [
//                 //                   BoxShadow(
//                 //                     color: Color(0xffF7A037).withOpacity(0.3),
//                 //                     spreadRadius: 1,
//                 //                     blurRadius: 2,
//                 //                     offset: const Offset(
//                 //                         0, 1), // changes position of shadow
//                 //                   ),
//                 //                 ],
//                 //               ),
//                 //               // color:
//                 //               //     Color(0xffF7A037).withOpacity(0.5),
//                 //               child: Column(
//                 //                 crossAxisAlignment: CrossAxisAlignment.center,
//                 //                 mainAxisAlignment: MainAxisAlignment.center,
//                 //                 children: [
//                 //                   Image(
//                 //                     height: size.height / 12,
//                 //                     image: AssetImage(
//                 //                         'images/category/${categorylist[index]}.png'),
//                 //                   ),
//                 //                   Text(
//                 //                     categorylist[index],
//                 //                     style: const TextStyle(
//                 //                       fontSize: 15,
//                 //                       // fontWeight: FontWeight.bold,
//                 //                     ),
//                 //                   ),
//                 //                   Text(
//                 //                     "${myproductsprice[index]}TK",
//                 //                     style: const TextStyle(
//                 //                         fontSize: 18,
//                 //                         fontWeight: FontWeight.bold,
//                 //                         color: Color(0xffF7A037)),
//                 //                   ),
//                 //                 ],
//                 //               )),
//                 //         );
//                 //       }),
//                 // ),
//                 loading ?Center(child: CircularProgressIndicator()):Expanded(
//                   child: ListView.builder(
//                     itemCount: list.length==null?0:list.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(list[index]['xitem'].toString()),
//                             SizedBox( width: 5,),
//                             Text(list[index]['xbimage']),
//                           ],),
//                         subtitle: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(list[index]['xshopno']),
//                             Text(list[index]['xdesc']),
//                           ],),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
