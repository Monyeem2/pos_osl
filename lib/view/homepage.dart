import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_mobile_version/view/pos/pos.dart';
import 'package:pos_mobile_version/view/pos/pos1.dart';
import 'package:pos_mobile_version/view/report/report_check.dart';
import 'package:pos_mobile_version/view/settings/settings_menu.dart';

import '../controller/drawer.dart';
import '../controller/item_info_insert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  bool loading = true;
  _loadFromApi() async {
    setState(() {
      loading = true;
    });

    var apiProvider = ItemInsertApiProvider();
    await apiProvider.getAllItem();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      loading = false;
    });
  }


  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        title: Image(
          image: AssetImage("images/logo/applogo.png"),
          height: size.height / 10,
          // fit: BoxFit.cover,
        ),
        // Text(
        //   "HOMEPAGE",
        //   style: GoogleFonts.lato(
        //       color: Color(0xff403B35),
        //       fontSize: size.height / 35,
        //       fontWeight: FontWeight.bold),
        // ),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(
            Icons.menu,
            color: Color(0xff403B35),
          ),
          onTap: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            } else {
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
        ),
        actions: <Widget>[

          IconButton(icon: Icon(Icons.get_app,color: Colors.black,), onPressed: (){
            _loadFromApi();
          }),

          IconButton(
            icon: Icon(
              Icons.logout,
              color: Color(0xff403B35),
            ),
            tooltip: 'LOGOUT',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      drawer: Drawer_page(),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => POS()));

                    },
                    child: Container(
                      height: size.height / 5,
                      width: size.height / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF1F7FC),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: const AssetImage("images/logo/pos.png"),
                            height: size.height / 10,
                          ),
                          Text(
                            "POS",
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 35,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height / 5,
                    width: size.height / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffF1F7FC),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: const AssetImage("images/logo/bills.png"),
                          height: size.height / 10,
                        ),
                        Text(
                          "BILLS",
                          style: TextStyle(
                            color: Color(0xff403B35),
                            fontSize: size.height / 35,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 52,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Report_check()));
                    },
                    child: Container(
                      height: size.height / 5,
                      width: size.height / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF1F7FC),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: const AssetImage("images/logo/report.png"),
                            height: size.height / 10,
                          ),
                          Text(
                            "REPORT",
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 35,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Settings_Menu()));

                    },
                    child: Container(
                      height: size.height / 5,
                      width: size.height / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF1F7FC),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: const AssetImage("images/logo/settings.png"),
                            height: size.height / 10,
                          ),
                          Text(
                            "SETTINGS",
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 35,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 52,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height / 5,
                    width: size.height / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffF1F7FC),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: const AssetImage("images/logo/signin.png"),
                          height: size.height / 10,
                        ),
                        Text(
                          "POS SIGN IN",
                          style: TextStyle(
                            color: Color(0xff403B35),
                            fontSize: size.height / 35,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: size.height / 5,
                      width: size.height / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF1F7FC),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: const AssetImage("images/logo/signout.png"),
                            height: size.height / 10,
                          ),
                          Text(
                            "POS SIGN OUT",
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 35,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
