// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
// class Cash_change extends StatefulWidget {
//   const Cash_change({Key? key}) : super(key: key);
//
//   @override
//   State<Cash_change> createState() => _Cash_changeState();
// }
//
// class _Cash_changeState extends State<Cash_change> {
//
//
//
//   TextEditingController grandcardChangetotalCalculated = TextEditingController();
//   var cardController = TextEditingController();
//   var cardChangeTotalValue = TextEditingController();
//   FocusNode _cardfocus = FocusNode();
//   FocusNode focusCardDiscount = FocusNode();
//
//   late String cardresult, lastcardValue;
//   late String totalcardText, cardText, cardChangeText;
//
//
//
//   @override
//   void dispose() {
//     super.dispose();
//     cardController.removeListener(() {
//       cardChangetotalCalculated();
//     });
//     grandcardChangetotalCalculated.removeListener(() {
//       cardChangetotalCalculated();
//     });
//     cardChangeTotalValue.removeListener(() {
//       cardChangetotalCalculated();
//     });
//   }
//
//   String cardChangetotalCalculated() {
//     totalcardText = "500";
//     cardText = cardController.text;
//     cardChangeText = cardChangeTotalValue.text;
//
//     if (totalcardText != '' && cardText != '' && !_cardfocus.hasFocus) {
//       cardresult = (double.parse(totalcardText) - double.parse(cardText)).toString();
//       lastcardValue = cardText;
//       cardChangeTotalValue.value = cardChangeTotalValue.value.copyWith(
//         text: cardresult.toString(),
//       );
//     }
//     if (totalcardText != '' && cardChangeText != null && !focusCardDiscount.hasFocus) {
//       cardChangeText = '0';
//       cardresult = (double.parse(totalcardText) - double.parse(cardChangeText)).toString();
//       cardController.value =
//           cardController.value.copyWith(
//             text: cardresult.toString(),
//           );
//     }
//     return cardresult;
//   }
//
//
//
//
//
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//
//     // setState((){
//     //   totalcardText = widget.invoiceTotal;
//     // });
//     //print(widget.invoiceTotal);
//
//     _cardfocus.addListener(() {
//       if (_cardfocus.hasFocus) {
//         cardChangeTotalValue.clear();
//       }
//     });
//     focusCardDiscount.addListener(() {
//       if (focusCardDiscount.hasFocus) {
//         cardController.clear();
//       }
//     });
//     grandcardChangetotalCalculated.addListener(() => setState(() {}));
//     cardController.addListener(() => setState(() {
//       cardChangetotalCalculated();
//     }));
//     cardChangeTotalValue.addListener(() => setState(() {
//       cardChangetotalCalculated();
//     }));
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("try"),
//         ),
//
//         body: Column(
//           children: [
//             Container(
//               //height: 50,
//               width: MediaQuery.of(context).size.width/2.3,
//               child: TextFormField(
//                 controller: cardController,
//                 focusNode: focusCardDiscount,
//                 style: TextStyle(
//                     color: Color(0xff403B35),
//                     fontSize: size.height / 45,
//                     fontWeight: FontWeight.normal),
//                 onChanged: (input) {
//                   // xdisc = input;
//                 },
//                 validator: (input) {
//                   if (input!.isEmpty) {
//                     return "Empty";
//                   }
//                 },
//                 keyboardType: TextInputType.number,
//                 inputFormatters: <TextInputFormatter>[
//                   // for below version 2 use this
//                   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// // for version 2 and greater youcan also use this
//                   FilteringTextInputFormatter.digitsOnly
//                 ],
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(
//                       left: 20), // add padding to adjust text
//                   isDense: false,
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         width: 3, color: Colors.greenAccent), //<-- SEE HERE
//                   ),
//                   labelText: "Special Discount",
//                   labelStyle: TextStyle(
//                       color: Color(0xff403B35),
//                       fontSize: size.height / 45,
//                       fontWeight: FontWeight.normal),
//                   border: InputBorder.none,
//                   // suffixIcon: Icon(
//                   //   Icons.restaurant,
//                   //   size: 35,
//                   //   color: Colors.black,
//                   // ),
//                 ),
//               ),
//             ),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Grand Total",style: TextStyle(
//                     color: Color(0xff403B35),
//                     fontSize: size.height / 35,
//                     fontWeight: FontWeight.bold),
//                 ),
//                 Text("${cardChangeTotalValue.text}",style: TextStyle(
//                     color: Color(0xff403B35),
//                     fontSize: size.height / 35,
//                     fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ],
//         ),
//
//       ),
//     );
//   }
// }
