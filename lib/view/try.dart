// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// class TryPage extends StatefulWidget {
//   @override
//   _TryPageState createState() => _TryPageState();
// }
//
// class _TryPageState extends State<TryPage> {
//   TextEditingController textEditingController = TextEditingController();
//   var velocityEditingController = TextEditingController();
//   var _finalValue = TextEditingController();
//   FocusNode _focus = FocusNode();
//   FocusNode _focusespecialDiscount = FocusNode();
//
//   late String sam, lastVelocityValue;
//   late String airFlowText, velocityText, finalText;
//
//   @override
//   void initState() {
//     super.initState();
//     _focus.addListener(() {
//       if (_focus.hasFocus) {
//         _finalValue.clear();
//       }
//     });
//     _focusespecialDiscount.addListener(() {
//       if (_focusespecialDiscount.hasFocus) {
//         velocityEditingController.clear();
//       }
//     });
//     textEditingController.addListener(() => setState(() {}));
//     velocityEditingController.addListener(() => setState(() {
//       totalCalculated();
//     }));
//     _finalValue.addListener(() => setState(() {
//       totalCalculated();
//     }));
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     velocityEditingController.removeListener(() {
//       totalCalculated();
//     });
//     textEditingController.removeListener(() {
//       totalCalculated();
//     });
//     _finalValue.removeListener(() {
//       totalCalculated();
//     });
//   }
//
//   String totalCalculated() {
//     airFlowText = textEditingController.text;
//     velocityText = velocityEditingController.text;
//     finalText = _finalValue.text;
//
//     if (airFlowText != '' && velocityText != '' && !_focus.hasFocus) {
//       sam = (int.parse(airFlowText) + int.parse(velocityText)).toString();
//       lastVelocityValue = velocityText;
//       _finalValue.value = _finalValue.value.copyWith(
//         text: sam.toString(),
//       );
//     }
//     if (airFlowText != '' && finalText != null && !_focusespecialDiscount.hasFocus) {
//       sam = (int.parse(airFlowText) - int.parse(finalText)).toString();
//       velocityEditingController.value =
//           velocityEditingController.value.copyWith(
//             text: sam.toString(),
//           );
//     }
//     return sam;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(left: 8.0, right: 8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               // key: Key(totalCalculated()),
//               controller: textEditingController,
//               onTap: () {
//                 setState(() {
//                   textEditingController.clear();
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Enter Value',
//                 labelText: 'Air Flow',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: velocityEditingController,
//               focusNode: _focusespecialDiscount,
//               decoration: InputDecoration(
//                 hintText: 'Enter Value',
//                 labelText: 'Velocity',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             TextFormField(
//               controller: _finalValue,
//               focusNode: _focus,
//               decoration: InputDecoration(
//                 hintText: 'Enter Value',
//                 labelText: 'Final Value',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             Text(
//                 'Entered Value is  ${textEditingController.text} + ${velocityEditingController.text} + ${_finalValue.text}'),
//             SizedBox(
//               height: 30,
//             ),
//             FlatButton(
//               padding: EdgeInsets.all(15.0),
//               color: Colors.blueGrey,
//               child: Text('Reset'),
//               onPressed: () {
//                 textEditingController.clear();
//                 velocityEditingController.clear();
//                 _finalValue.clear();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }