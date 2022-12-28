import 'package:flutter/material.dart';
import 'package:pos_mobile_version/view/homepage.dart';

import '../view/pos/pos.dart';
import '../view/pos/pos1.dart';

class Drawer_page extends StatefulWidget {
  const Drawer_page({Key? key}) : super(key: key);

  @override
  State<Drawer_page> createState() => _Drawer_pageState();
}

class _Drawer_pageState extends State<Drawer_page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width / 4,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Column(
              children: [
                Container(
                  height: size.height/12,
                  // width: 100,
                  child: Image(
                      image: AssetImage("images/logo/applogo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context,
                 MaterialPageRoute(builder: (context) => HomePage()));
            },
            hoverColor: Colors.red,
          ),
          SizedBox(
            height: size.height / 35,
          ),
          ListTile(
            hoverColor: Colors.red,
            focusColor: Colors.red,
            selectedColor: Colors.red,
            tileColor: Colors.white, //full bar color
            title: Column(
              children: [
                SizedBox(
                  height: size.height/17,
                  child: Image(
                    image: AssetImage("images/logo/pos.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'POS',
                  style: TextStyle(
                    color: Color(0xff403B35),
                    fontSize: size.height / 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => POS()));
            },
          ),
          SizedBox(
            height: size.height / 35,
          ),
          ListTile(
            title: Column(

              children: [
                SizedBox(
                  height: size.height/17,
                  child: Image(
                    image: AssetImage("images/logo/bills.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'BILLS',
                  style: TextStyle(
                    color: Color(0xff403B35),
                    fontSize: size.height / 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              //Navigator.push(context,
    //              MaterialPageRoute(builder: (context) => Menu()));
            },
          ),
          SizedBox(
            height: size.height / 35,
          ),
          ListTile(
            title: Column(
              children: [
                SizedBox(
                  height: size.height/17,
                  child: Image(
                    image: AssetImage("images/logo/report.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'REPORT',
                  style: TextStyle(
                    color: Color(0xff403B35),
                    fontSize: size.height / 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap:() {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const Dashboard()));
            },
          ),
          SizedBox(
            height: size.height / 35,
          ),
          ListTile(
            title: Column(
              children: [
                SizedBox(
                  height: size.height/17,
                  child: Image(
                    image: AssetImage("images/logo/settings.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'SETTINGS',
                  style: TextStyle(
                    color: Color(0xff403B35),
                    fontSize: size.height / 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const Report()));

            },
          ),
          SizedBox(
            height: size.height / 35,
          ),
    //       ListTile(
    //         title: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             SizedBox(
    //               height: size.height/17,
    //               child: Image(
    //                 image: AssetImage("images/logo/foodrequest.png"),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             Text(
    //               'Food Request',
    //               style: TextStyle(
    //                 color: Color(0xff403B35),
    //                 fontSize: size.height / 60,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ],
    //         ),
    //         onTap: () {
    //
    //         },
    //       ),
    //       SizedBox(
    //         height: size.height / 35,
    //       ),
    //       ListTile(
    //         title: Column(
    //           children: [
    //             SizedBox(
    //               height: size.height/17,
    //               child: Image(
    //                 image: AssetImage("images/logo/editorder.png"),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             Text(
    //               'Edit Order',
    //               style: TextStyle(
    //                 color: Color(0xff403B35),
    //                 fontSize: size.height / 60,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ],
    //         ),
    //         onTap: () {
    //           // Update the state of the app
    //           // ...
    //           // Then close the drawer
    //
    //           // Navigator.push(
    //           //     context,
    //           //     MaterialPageRoute(
    //           //         builder: (context) => const Report()));
    //
    //         },
    //       ),
    //       SizedBox(
    //         height: size.height / 35,
    //       ),
    //       ListTile(
    //         title: Column(
    //           children: [
    //             SizedBox(
    //               height: size.height/17,
    //               child: Image(
    //                 image: AssetImage("images/logo/foodadd.png"),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             Text(
    //               'Edit Items',
    //               style: TextStyle(
    //                 color: Color(0xff403B35),
    //                 fontSize: size.height / 60,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ],
    //         ),
    //         onTap: () {
    //           //Navigator.push(context,
    // //              MaterialPageRoute(builder: (context) => Food_items()));
    //         },
    //       ),
    //       SizedBox(
    //         height: size.height / 35,
    //       ),
    //       ListTile(
    //         title: Column(
    //           children: [
    //             SizedBox(
    //               height: size.height/17,
    //               child: Image(
    //                 image: AssetImage("images/logo/myres.png"),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             Text(
    //               'My Restaurant',
    //               style: TextStyle(
    //                 color: Color(0xff403B35),
    //                 fontSize: size.height / 60,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ],
    //         ),
    //         onTap: () {
    //           //Navigator.push(context,
    // //              MaterialPageRoute(builder: (context) => My_restaurant()));
    //         },
    //       ),
        ],
      ),
    );
  }
}
