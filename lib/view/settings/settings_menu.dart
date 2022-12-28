import 'package:flutter/material.dart';
import 'package:pos_mobile_version/view/settings/business_menu/Business_Settings.dart';
import 'package:pos_mobile_version/view/settings/item_menu/item_entry.dart';
import 'package:pos_mobile_version/view/settings/item_menu/item_settings.dart';
import 'package:pos_mobile_version/view/settings/user_menu/user_settings.dart';
import '../../controller/drawer.dart';
class Settings_Menu extends StatefulWidget {
  const Settings_Menu({Key? key}) : super(key: key);

  @override
  State<Settings_Menu> createState() => _Settings_MenuState();
}

class _Settings_MenuState extends State<Settings_Menu> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xffFAFAFA),
            title:
            Text(
              "SETTINGS",
              style: TextStyle(
                  color: Color(0xff403B35),
                  fontSize: size.height / 38,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Color(0xff403B35),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
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
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Item_entry()));

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
                                image: const AssetImage("images/logo/transaction.png"),
                                height: size.height / 10,
                              ),
                              Text(
                                "TRANSACTION",
                                style: TextStyle(
                                  color: Color(0xff403B35),
                                  fontSize: size.height / 38,
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
                              MaterialPageRoute(builder: (context) => Item_Settings()));

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
                                image: const AssetImage("images/logo/foodadd.png"),
                                height: size.height / 10,
                              ),
                              Text(
                                "ITEM",
                                style: TextStyle(
                                  color: Color(0xff403B35),
                                  fontSize: size.height / 38,
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
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Business_Settings()));


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
                                image: const AssetImage("images/logo/business.png"),
                                height: size.height / 10,
                              ),
                              Text(
                                "BUSINESS",
                                style: TextStyle(
                                  color: Color(0xff403B35),
                                  fontSize: size.height / 38,
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
                              MaterialPageRoute(builder: (context) => User_Settings()));

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
                                image: const AssetImage("images/logo/user.png"),
                                height: size.height / 10,
                              ),
                              Text(
                                "USER",
                                style: TextStyle(
                                  color: Color(0xff403B35),
                                  fontSize: size.height / 38,
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
