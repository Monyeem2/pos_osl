import 'package:flutter/material.dart';
import 'package:pos_mobile_version/controller/cart_controller.dart';
import 'package:pos_mobile_version/view/try.dart';

import '../../controller/controller.dart';
import '../../model/cart_category.dart';
import '../../model/in.dart';
import 'bill_screen.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({Key? key}) : super(key: key);

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}


enum Payment_process { handcsh, onlinecash }

class _Cart_ScreenState extends State<Cart_Screen> {


  // List categorylist = [
  //   'Burger',
  //   'Cake',
  //   'Drinks',
  //   'Pizza',
  //   'Sandwich',
  //   'Sides',
  //   'Sides',
  //   'Sides',
  //   'Sides',
  //   'Sides',
  // ];
  // List myproductsprice = [
  //   '210',
  //   '120',
  //   '30',
  //   '780',
  //   '209',
  //   '99',
  //   '99',
  //   '99',
  //   '99',
  //   '99'
  // ];
  // List quantity = [
  //   '10',
  //   '1',
  //   '3',
  //   '7',
  //   '2',
  //   '9',
  //   '7',
  //   '5',
  //   '1',
  //   '6'
  // ];

  int qnty = 1;
  double xlineamt = 1;

  late String payment = "handcash";
  Payment_process? payment_process = Payment_process.handcsh;
  String dropdownValue = 'Pick';

  late List cartlist = [];
  bool loading = true;
  Future cartList()async{
    cartlist = await Controller().fetchData_from_cart();
    setState(() {loading=false;});
    //print(list);
  }

  String discountFromCart = "0";
  Future getDiscountFromCart()async{
    discountFromCart = await Controller().getDiscount_from_cart();
    setState(() {loading=false;});
    //print(list);
  }

  String vatFromCart = "0";
  Future getvatFromCart()async{
    vatFromCart = await Controller().getVat_from_cart();
    setState(() {loading=false;});
    //print(list);
  }

  String sdFromCart = "0";
  Future getSDFromCart()async{
    sdFromCart = await Controller().getSD_from_cart();
    setState(() {loading=false;});
    //print(list);
  }

  String sumFromCart = "0";
  Future getSumFromCart()async{
    sumFromCart = await Controller().getTotal_from_cart();
    setState(() {loading=false;});
    //print(list);
  }

  String netAmountFromCart = "0";

  Future netPayCalculation()async{
    // netPayable = double.parse(sumFromDetails)+double.parse(vatFromDetails)-double.parse(discountFromDetails);
    // print("sumFromDetails"+sumFromDetails.toString());
    // print("vatFromDetails"+vatFromDetails.toString());
    // print("discountFromDetails"+discountFromDetails.toString());
    // print("netPayable"+netPayable.toString());
    netAmountFromCart = await Controller().getnetAmount_from_cart();
    setState(() {
      loading=false;
    });
  }

  double paidamount = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartList();
    getSumFromCart();
    getSDFromCart();
    getvatFromCart();
    getDiscountFromCart();
    netPayCalculation();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFAFAFA),
          title: Text(
            "Order Details",
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
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Items",
                  style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 35,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: size.height / 2,
                  child: ListView.builder(
                      itemCount: cartlist.length==null?0:cartlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            // leading:  Icon(Icons.list),
                            trailing: Text(
                              '${cartlist[index]['xlineamt']}/-',
                              style: TextStyle(
                                  color: Color(0xff403B35),
                                  fontSize: size.height / 35,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${cartlist[index]['xdesc']}',
                                  style: TextStyle(
                                      color: Color(0xff403B35),
                                      fontSize: size.height / 38,
                                      // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      width: size.width/2.9 ,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                qnty = cartlist[index]['product_qnty'];
                                                setState((){
                                                  qnty++;
                                                  xlineamt = cartlist[index]['xrate'] * qnty;
                                                });
                                                await Controller().updateData_from_cart(qnty,xlineamt,cartlist[index]['id']).then((value){
                                                  if (value>0) {
                                                    print("Success");
                                                  }else{
                                                    print("Failed");
                                                  }

                                                });

                                                cartList();
                                                getSumFromCart();
                                                getSDFromCart();
                                                getvatFromCart();
                                                getDiscountFromCart();
                                                netPayCalculation();
                                              },
                                              icon: Icon(Icons.add)),
                                          Text(
                                            '${cartlist[index]['product_qnty']}',
                                            style: TextStyle(
                                              color: Color(0xff403B35),
                                              fontSize: size.height / 45,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () async {
                                                qnty = cartlist[index]['product_qnty'];
                                                setState((){
                                                  qnty--;
                                                  xlineamt = cartlist[index]['xrate'] * qnty;
                                                });

                                                if(qnty < 1){
                                                  await Controller().deleteData_from_cart(cartlist[index]['id']).then((value){
                                                    if (value>0) {
                                                      print("Success");
                                                    }else{
                                                      print("Failed");
                                                    }

                                                  });

                                                  setState(() {
                                                    cartlist.removeAt(index);
                                                  });
                                                }else{
                                                  await Controller().updateData_from_cart(qnty,xlineamt,cartlist[index]['id']).then((value){
                                                    if (value>0) {
                                                      print("Success");
                                                    }else{
                                                      print("Failed");
                                                    }

                                                  });
                                                }
                                                cartList();
                                                getSumFromCart();
                                                getSDFromCart();
                                                getvatFromCart();
                                                getDiscountFromCart();
                                                netPayCalculation();
                                              },
                                              icon: Icon(Icons.remove)),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(width: 10,),
                                    IconButton(
                                        onPressed: () async {
                                          await Controller().deleteData_from_cart(cartlist[index]['id']).then((value){
                                            if (value>0) {
                                              print("Success");
                                            }else{
                                              print("Failed");
                                            }

                                          });

                                          setState(() {
                                            cartlist.removeAt(index);
                                          });

                                          cartList();
                                          getSumFromCart();
                                          getSDFromCart();
                                          getvatFromCart();
                                          getDiscountFromCart();
                                          netPayCalculation();
                                        },
                                        icon: Icon(Icons.delete_forever,color: Colors.red,)),
                                  ],
                                ),
                              ],
                            ));
                      }),
                ),


                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: size.height / 2.5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),

                          Text(
                            "${discountFromCart == "null" ? 0.0 : discountFromCart}",
                            //'${discountFromCart}',
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Vat',
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),

                          Text(
                            "${vatFromCart == "null" ? 0.0 : vatFromCart}",
                            //'${vatFromCart}',
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'SD',
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),

                          Text(
                            "${sdFromCart == "null" ? 0.0 : sdFromCart}",
                            //'${sdFromCart}',
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Service Charge',
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),

                          Text(
                            '0.0',
                            style: TextStyle(
                              color: Color(0xff403B35),
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Invoice Total',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: size.height / 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "${sumFromCart == "null" ? 0.0 : sumFromCart}",
                            //'${sumFromCart}',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: size.height / 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),



                      SizedBox(height: 10,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Net Total Amount',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: size.height / 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "${netAmountFromCart == "null" ? 0.0 : netAmountFromCart}",
                            //'${sumFromCart}',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: size.height / 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),


                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Take_Charges(
                            invoiceTotal: netAmountFromCart,
                          )));
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>Cash_change()));

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
                              "Proceed",
                              style: TextStyle(
                                color: Color(0xff403B35),
                                fontSize: size.height / 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
