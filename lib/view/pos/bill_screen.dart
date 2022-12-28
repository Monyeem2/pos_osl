


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controller/bill_controller.dart';
import '../../controller/controller.dart';
import '../../model/bill_details_add_model.dart';
import '../../model/bill_header_add_model.dart';
import 'bill_print.dart';


class Take_Charges extends StatefulWidget {

  Take_Charges({required this.invoiceTotal});
  String invoiceTotal;

  @override
  State<Take_Charges> createState() => _Take_ChargesState();
}

class _Take_ChargesState extends State<Take_Charges> {
  String dropdownValue = 'A Bank';
  //String gender = "male";
  
  
  bool loading = true;

  double special_discount = 0.0;
  String netAmountFromCart = "0";
  Future getSumFromCart()async{
    netAmountFromCart = await Controller().getnetAmount_from_cart();
    setState(() {loading=false;});
    //print(list);
  }


  String vatsumFromCart = "0";
  Future getvatSumFromCart()async{
    vatsumFromCart = await Controller().getVat_from_cart();
    setState(() {loading=false;});
    //print(list);
  }

  late List cartlist = [];
  Future cartList()async{
    cartlist = await Controller().fetchData_from_cart();
    setState(() {loading=false;});
    //print(list);
  }
  
  
  

  TextEditingController invoiceEditingController = TextEditingController();
  var specialDiscountController = TextEditingController();
  var grandTotalValue = TextEditingController();
  FocusNode _focus = FocusNode();
  FocusNode _focusespecialDiscount = FocusNode();

  late String sam, lastspecialDiscountValue;
  late String invoiceText, specialDiscountText, grandTotalText;


  /////change
  TextEditingController grandTotalEditingController = TextEditingController();
  var cashController = TextEditingController();
  var changeTotalValue = TextEditingController();
  FocusNode _cashfocus = FocusNode();
  FocusNode focusCashDiscount = FocusNode();

  late String result, lastcashValue;
  late String totalcashText, cashText, changeText;


  ///////card change
  TextEditingController grandcardChangetotalCalculated = TextEditingController();
  var cardController = TextEditingController();
  var cardChangeTotalValue = TextEditingController();
  FocusNode _cardfocus = FocusNode();
  FocusNode focusCardDiscount = FocusNode();

  late String cardresult, lastcardValue;
  late String totalcardText, cardText, cardChangeText;



  @override
  void dispose() {
    super.dispose();
    specialDiscountController.removeListener(() {
      grandtotalCalculated();
    });
    invoiceEditingController.removeListener(() {
      grandtotalCalculated();
    });
    grandTotalValue.removeListener(() {
      grandtotalCalculated();
    });



    ////change
    cashController.removeListener(() {
      changetotalCalculated();
    });
    grandTotalEditingController.removeListener(() {
      changetotalCalculated();
    });
    changeTotalValue.removeListener(() {
      changetotalCalculated();
    });

    ////cardChange
    cardController.removeListener(() {
      cardChangetotalCalculated();
    });
    grandcardChangetotalCalculated.removeListener(() {
      cardChangetotalCalculated();
    });
    cardChangeTotalValue.removeListener(() {
      cardChangetotalCalculated();
    });

  }


  String grandtotalCalculated() {
    invoiceText = widget.invoiceTotal;
    if (specialDiscountController.text == '') {
      specialDiscountText = '0.0';
    } else {
      specialDiscountText = specialDiscountController.text;
    }
    grandTotalText = grandTotalValue.text;

    if (invoiceText != '' && specialDiscountText != '' && !_focus.hasFocus) {
      sam = (double.parse(invoiceText) - double.parse(specialDiscountText)).toString();
      lastspecialDiscountValue = specialDiscountText;
      grandTotalValue.value = grandTotalValue.value.copyWith(
        text: sam.toString(),
      );
    }
    if (invoiceText != '' && grandTotalText != null && !_focusespecialDiscount.hasFocus) {
      grandTotalText = '0';
      sam = (double.parse(invoiceText) - double.parse(grandTotalText)).toString();
      specialDiscountController.value =
          specialDiscountController.value.copyWith(
            text: sam.toString(),
          );
    }
    return sam;
  }



  String changetotalCalculated() {
    totalcashText = grandTotalValue.text;

    if (cashController.text == '') {
      cashText = '0';
    } else {
      cashText = cashController.text;
    }


    changeText = changeTotalValue.text;

    if (totalcashText != '' && cashText != '' && !_cashfocus.hasFocus) {
      result = (double.parse(totalcashText) - double.parse(cashText)).toString();
      lastcashValue = cashText;
      changeTotalValue.value = changeTotalValue.value.copyWith(
        text: result.toString(),
      );
    }
    if (totalcashText != '' && changeText != null && !focusCashDiscount.hasFocus) {
      changeText = '0';
      result = (double.parse(totalcashText) - double.parse(changeText)).toString();
      cashController.value =
          cashController.value.copyWith(
            text: result.toString(),
          );
    }
    return result;
  }



  ///////card change
  String cardChangetotalCalculated() {
    totalcardText = changeTotalValue.text;

    if (cardController.text == '') {
      cardText = '0';
    } else {
      cardText = cardController.text;
    }


    cardChangeText = cardChangeTotalValue.text;

    if (totalcardText != '' && cardText != '' && !_cardfocus.hasFocus) {
      cardresult = (double.parse(totalcardText) - double.parse(cardText)).toString();
      lastcardValue = cardText;
      cardChangeTotalValue.value = cardChangeTotalValue.value.copyWith(
        text: cardresult.toString(),
      );
    }
    if (totalcardText != '' && cardChangeText != null && !focusCardDiscount.hasFocus) {
      cardChangeText = '0';
      cardresult = (double.parse(totalcardText) - double.parse(cardChangeText)).toString();
      cardController.value =
          cardController.value.copyWith(
            text: cardresult.toString(),
          );
    }
    return cardresult;
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSumFromCart();
    cartList();

    // setState((){
    //   invoiceText = widget.invoiceTotal;
    // });
    print(widget.invoiceTotal);


    ////special Discount change
    _focus.addListener(() {
      if (_focus.hasFocus) {
        grandTotalValue.clear();
      }
    });
    _focusespecialDiscount.addListener(() {
      if (_focusespecialDiscount.hasFocus) {
        specialDiscountController.clear();
      }
    });
    invoiceEditingController.addListener(() => setState(() {}));
    specialDiscountController.addListener(() => setState(() {
      grandtotalCalculated();
    }));
    grandTotalValue.addListener(() => setState(() {
      grandtotalCalculated();
    }));


      ///////////cash change
    _cashfocus.addListener(() {
      if (_cashfocus.hasFocus) {
        changeTotalValue.clear();
      }
    });
    focusCashDiscount.addListener(() {
      if (focusCashDiscount.hasFocus) {
        cashController.clear();
      }
    });
    grandTotalEditingController.addListener(() => setState(() {}));
    cashController.addListener(() => setState(() {
      changetotalCalculated();
    }));
    changeTotalValue.addListener(() => setState(() {
      changetotalCalculated();
    }));



    ///////card Change
    _cardfocus.addListener(() {
      if (_cardfocus.hasFocus) {
        cardChangeTotalValue.clear();
      }
    });
    focusCardDiscount.addListener(() {
      if (focusCardDiscount.hasFocus) {
        cardController.clear();
      }
    });
    grandcardChangetotalCalculated.addListener(() => setState(() {}));
    cardController.addListener(() => setState(() {
      cardChangetotalCalculated();
    }));
    cardChangeTotalValue.addListener(() => setState(() {
      cardChangetotalCalculated();
    }));

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xffFAFAFA),
        title: Text(
          "Invoice Details",
          style: TextStyle(
              color: Color(0xff403B35),
              fontSize: size.height / 35,
              fontWeight: FontWeight.normal),
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
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Items",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.bold),
                  ),
                  Text("${cartlist.length==null?0:cartlist.length}",
                    style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("Total Quantity",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 45,
              //         fontWeight: FontWeight.bold),
              //     ),
              //     Text("7",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 45,
              //         fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Invoice Total",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 35,
                      fontWeight: FontWeight.bold),
                  ),

                  // Container(
                  //   width: 50,
                  //   child: TextFormField(
                  //     // key: Key(totalCalculated()),
                  //     controller: invoiceEditingController,
                  //     onTap: () {
                  //       setState(() {
                  //         invoiceEditingController.clear();
                  //       });
                  //     },
                  //     decoration: InputDecoration(
                  //       hintText: 'Enter Value',
                  //       labelText: 'Air Flow',
                  //     ),
                  //     keyboardType: TextInputType.number,
                  //   ),
                  // ),
                  
                  
                  Text("${netAmountFromCart == "null" ? 0.0 : netAmountFromCart}",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 35,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("(-) Discount",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 45,
              //         fontWeight: FontWeight.normal),
              //     ),
              //     Text("7",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 45,
              //         fontWeight: FontWeight.normal),
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("(-) Special Discount",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                  Text("${specialDiscountController.text}",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("(+) Service Charge",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                  Text("0",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("(+) VAT",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 45,
              //         fontWeight: FontWeight.normal),
              //     ),
              //     Text("7",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 45,
              //         fontWeight: FontWeight.normal),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("(+) SD",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 45,
              //         fontWeight: FontWeight.normal),
              //     ),
              //     Text("7",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 45,
              //         fontWeight: FontWeight.normal),
              //     ),
              //   ],
              // ),

              // TextFormField(
              //   controller: grandTotalValue,
              //   focusNode: _focus,
              //   decoration: InputDecoration(
              //     hintText: 'Enter Value',
              //     labelText: 'Final Value',
              //   ),
              //   keyboardType: TextInputType.number,
              // ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Grand Total",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 35,
                      fontWeight: FontWeight.bold),
                  ),
                  Text("${grandTotalValue.text}",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 35,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("(-) Due",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 35,
              //         fontWeight: FontWeight.bold),
              //     ),
              //     Text("7",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 35,
              //         fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("(+)Paid Total",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 35,
              //         fontWeight: FontWeight.bold),
              //     ),
              //     Text("7",style: TextStyle(
              //         color: Color(0xff403B35),
              //         fontSize: size.height / 35,
              //         fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0,right:  10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text("(+)Cash",style: TextStyle(
              //           color: Color(0xff403B35),
              //           fontSize: size.height / 35,
              //           fontWeight: FontWeight.normal),
              //       ),
              //       Text("7",style: TextStyle(
              //           color: Color(0xff403B35),
              //           fontSize: size.height / 35,
              //           fontWeight: FontWeight.normal),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0,right:  10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text("(+)Card",style: TextStyle(
              //           color: Color(0xff403B35),
              //           fontSize: size.height / 35,
              //           fontWeight: FontWeight.normal),
              //       ),
              //       Text("7",style: TextStyle(
              //           color: Color(0xff403B35),
              //           fontSize: size.height / 35,
              //           fontWeight: FontWeight.normal),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
//                   Container(
//                     //height: 50,
//                     width: MediaQuery.of(context).size.width/2.3,
//                     child: TextFormField(
//                       style: TextStyle(
//                           color: Color(0xff403B35),
//                           fontSize: size.height / 45,
//                           fontWeight: FontWeight.normal),
//                       onChanged: (input) {
//                         // xdisc = input;
//                       },
//                       validator: (input) {
//                         if (input!.isEmpty) {
//                           return "Empty";
//                         }
//                       },
//                       keyboardType: TextInputType.number,
//                       inputFormatters: <TextInputFormatter>[
//                         // for below version 2 use this
//                         FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// // for version 2 and greater youcan also use this
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.only(
//                             left: 20), // add padding to adjust text
//                         isDense: false,
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 3, color: Colors.greenAccent), //<-- SEE HERE
//                         ),
//                         labelText: "Discount",
//                         labelStyle: TextStyle(
//                             color: Color(0xff403B35),
//                             fontSize: size.height / 45,
//                             fontWeight: FontWeight.normal),
//                         border: InputBorder.none,
//                         // suffixIcon: Icon(
//                         //   Icons.restaurant,
//                         //   size: 35,
//                         //   color: Colors.black,
//                         // ),
//                       ),
//                     ),
//                   ),
                  Container(
                    //height: 50,
                    width: MediaQuery.of(context).size.width/2.3,
                    child: TextFormField(
                      controller: specialDiscountController,
                      focusNode: _focusespecialDiscount,
                      style: TextStyle(
                          color: Color(0xff403B35),
                          fontSize: size.height / 45,
                          fontWeight: FontWeight.normal),
                      onChanged: (input) {
                        // xdisc = input;
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
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Colors.greenAccent), //<-- SEE HERE
                        ),
                        labelText: "Special Discount",
                        labelStyle: TextStyle(
                            color: Color(0xff403B35),
                            fontSize: size.height / 45,
                            fontWeight: FontWeight.normal),
                        border: InputBorder.none,
                        // suffixIcon: Icon(
                        //   Icons.restaurant,
                        //   size: 35,
                        //   color: Colors.black,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("Payment Method",
                style: TextStyle(
                    color: Color(0xff403B35),
                    fontSize: size.height / 35,
                    fontWeight: FontWeight.bold),
              ),
              // RadioListTile(
              //   title: Text("Cash"),
              //   value: "Cash",
              //   groupValue: gender,
              //   onChanged: (value){
              //     setState(() {
              //       gender = value.toString();
              //     });
              //   },
              // ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Cash",
                        style: TextStyle(
                            color: Color(0xff403B35),
                            fontSize: size.height / 40,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: (){
                          // setState((){
                          //   cashController.text = grandTotalEditingController.text;
                          // });

                        },
                        child: Container(
                          height: size.height / 25,
                          width: size.width / 4,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Text("Full Cash",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height / 40,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //height: 50,
                        width: MediaQuery.of(context).size.width/2.3,
                        child: TextFormField(
                          controller: cashController,
                          focusNode: focusCashDiscount,
                          style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal),
                          onChanged: (input) {
                            // xdisc = input;
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.greenAccent), //<-- SEE HERE
                            ),
                            labelText: "AMOUNT",
                            labelStyle: TextStyle(
                                color: Color(0xff403B35),
                                fontSize: size.height / 45,
                                fontWeight: FontWeight.normal),
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
                        width: 10,
                      ),
                      Text("${changeTotalValue.text}",
                        style: TextStyle(
                            color: Color(0xff403B35),
                            fontSize: size.height / 40,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  )
                ],
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Card",
                        style: TextStyle(
                            color: Color(0xff403B35),
                            fontSize: size.height / 40,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        child: Container(
                          height: size.height / 25,
                          width: size.width / 4,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child:  DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black,fontSize: 15),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['A Bank','B Bank','C Bank', 'D Bank'] //, 'Leave without pay ', 'Replacement Leave','special leave'
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //height: 50,
                        width: MediaQuery.of(context).size.width/2.3,
                        child: TextFormField(
                          controller: cardController,
                          focusNode: focusCardDiscount,
                          style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal),
                          onChanged: (input) {
                            // xdisc = input;
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.greenAccent), //<-- SEE HERE
                            ),
                            labelText: "AMOUNT",
                            labelStyle: TextStyle(
                                color: Color(0xff403B35),
                                fontSize: size.height / 45,
                                fontWeight: FontWeight.normal),
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
                        width: 10,
                      ),
                      Text("${cardChangeTotalValue.text}",
                        style: TextStyle(
                            color: Color(0xff403B35),
                            fontSize: size.height / 40,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 20,),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Take_Charges(
                    //   invoiceTotal: sumFromCart,
                    // )));

                    var range = new Random();
                    var donumber = range.nextInt(900000) + 100000;
                    print(donumber);

                    Bill_header_add_Model bill_header_add_model = Bill_header_add_Model(
                      xdornum:  "DO-$donumber",
                      xacashamt:  "xacashamt",
                      xacrdamt:  "xacrdamt",
                      xamount: double.parse(grandTotalValue.text),
                      xbonuspoints:  "xbonuspoints",
                      xcardamt:  double.parse(cardController.text),
                      xcardno:  "xcardno",
                      xcardtype:  dropdownValue,
                      xcashamt:  double.parse(cashController.text),
                      xchange:  double.parse("0.0"),
                      xcus:  "xcus",
                      xdate:  DateTime.now().toString(),
                      xdisc:  "0.0",
                      xdiscamt:  double.parse(specialDiscountController.text),
                      xdiscf:  "xdiscf",
                      xdiv:  "xdiv",
                      xexpamt:  "xexpamt",
                      xfield:  "xfield",
                      xnetamt:  "xnetamt",
                      xnote:  "xnote",
                      xnote1:  "xnote1",
                      xpaid:  double.parse(grandTotalValue.text),
                      xpaymentterm:  "xpaymentterm",
                      xpaymenttype:  "xpaymenttype",
                      xpaytype:  "xpaytype",
                      xperson:  "xperson",
                      xref:  "xref",
                      xroundingchange:  "xroundingchange",
                      xshift:  "xshift",
                      xshopno:  "xshopno",
                      xstatusprint:  "xstatusprint",
                      xsupptaxamt:  "xsupptaxamt",
                      xterminal:  "xterminal",
                      xtotamt:  double.parse(grandTotalValue.text),
                      xvatamt:  double.parse(vatsumFromCart),
                      xworkingdate:  DateTime.now().toString(),
                      zauserid:  "zauserid",
                      zid:  "zid",
                      ztime:  "ztime",
                      zutime:  "zutime",
                      zuuserid:  "zuuserid",
                      //sd data
                    );

                    await Bill_Controller().addDatatToBillHeader(bill_header_add_model).then((value){
                      if (value>0) {
                        print("Success");
                      }else{
                        print("Failed");
                      }

                    });

                    // Bill_details_add_Model bill_details_add_model = Bill_details_add_Model(
                    //   xdornum: "DO-$donumber",
                    //   xrow: "xrow",
                    //   xaddonrow: "xaddonrow",
                    //   xdisc: "xdisc",
                    //   xdiscamt: "xdiscamt",
                    //   xdisctype: "xdisctype",
                    //   xdorrow: "xdorrow",
                    //   xitem: "xitem",
                    //   xlineamt: "xlineamt",
                    //   xnetamt: "xnetamt",
                    //   xnote: "xnote",
                    //   xqtyord: "xqtyord",
                    //   xrate: "xrate",
                    //   xshopno: "xshopno",
                    //   xstatusgl: "xstatusgl",
                    //   xsupptaxamt: "xsupptaxamt",
                    //   xsupptaxrate: "xsupptaxrate",
                    //   xterminal: "xterminal",
                    //   xvatamt: "xvatamt",
                    //   xvatrate: "xvatrate",
                    //   zauserid: "zauserid",
                    //   zid: 11,
                    //   ztime: "ztime",
                    //   zutime: "zutime",
                    //   zuuserid: "zuuserid",//sd data
                    // );

                    await Bill_Controller().cart_to_Details('DO-$donumber');
                    //     .then((value){
                    //   // if (value>0) {
                    //   //   print("Success");
                    //   // }else{
                    //   //   print("Failed");
                    //   // }
                    //
                    // });

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bill_Print(xdornum: 'DO-$donumber', spDiscount: specialDiscountController.text,)));
                  },
                  child: Container(
                    height: size.height / 12,
                    width: size.height / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange,
                    ),
                    child: Center(
                      child: Text(
                        "Print Bill",
                        style: TextStyle(
                          color: Color(0xff403B35),
                          fontSize: size.height / 35,
                          fontWeight: FontWeight.bold,
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