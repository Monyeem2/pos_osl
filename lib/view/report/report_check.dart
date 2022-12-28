import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Report_check extends StatefulWidget {
  const Report_check({Key? key}) : super(key: key);

  @override
  State<Report_check> createState() => _Report_checkState();
}

class _Report_checkState extends State<Report_check> {
  String dropdownValue = 'Pick';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        title: Text(
          "REPORT",
          style: TextStyle(
              color: Color(0xff403B35),
              fontSize: size.height / 35,
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
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "REPORT TYPE",
                style: TextStyle(
                    color: Color(0xff403B35),
                    fontSize: size.height / 35,
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height / 40,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'Pick',
                  'Signout Slip',
                  'Credit Card Slip',
                  'Item Wise Slip'
                ] //, 'Leave without pay ', 'Replacement Leave','special leave'
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "SHIFT NO",
                style: TextStyle(
                    color: Color(0xff403B35),
                    fontSize: size.height / 35,
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height / 40,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'Pick',
                  'SHIFT 01',
                  'SHIFT 02',
                  'SHIFT 03'
                ] //, 'Leave without pay ', 'Replacement Leave','special leave'
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "DATE",
                style: TextStyle(
                    color: Color(0xff403B35),
                    fontSize: size.height / 35,
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height / 40,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'Pick',
                  'Signout Slip',
                  'Credit Card Slip',
                  'Item Wise Slip'
                ] //, 'Leave without pay ', 'Replacement Leave','special leave'
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 40, left: 40),
                child: GestureDetector(
                  onTap: () {
                    print("object");
                    // add_item();
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.green,
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
                        "PRINT BILL",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 10.0, bottom: 10.0, right: 40, left: 40),
              //   child: GestureDetector(
              //     onTap: () {
              //       print("object");
              //       // add_item();
              //     },
              //     child: Container(
              //       height: 40,
              //       width: MediaQuery.of(context).size.width,
              //       decoration: BoxDecoration(
              //         color: Color(0xffEC7906),
              //         borderRadius: BorderRadius.circular(20),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 1,
              //             blurRadius: 2,
              //             offset: Offset(0, 3), // changes position of shadow
              //           ),
              //         ],
              //       ),
              //       child: Center(
              //         child: Text(
              //           "REPRINT",
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 40, left: 40),
                child: GestureDetector(
                  onTap: () {
                    print("object");
                    // add_item();
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.red,
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
                        "RESET",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
    ));
  }
}
