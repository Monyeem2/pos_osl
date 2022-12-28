import 'package:flutter/material.dart';
import 'package:pos_mobile_version/controller/bill_controller.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
class Bill_Print extends StatefulWidget {

  Bill_Print({required this.xdornum, required this.spDiscount});
  String xdornum;
  String spDiscount;

  @override
  State<Bill_Print> createState() => _Bill_PrintState();
}

class _Bill_PrintState extends State<Bill_Print> {


  late List headerlist = [];
  bool loading = true;
  Future headerList()async{
    headerlist = await Bill_Controller().fetchData_from_Header(widget.xdornum);
    print("headerlist");
    print(headerlist);
    setState(() {loading=false;});
    //print(list);
  }

  late List detailslist = [];
  Future detailsList()async{
    detailslist = await Bill_Controller().fetchData_from_details(widget.xdornum);
    print("detailslist");
    print(detailslist);
    setState(() {loading=false;});
    //print(list);
  }

  String discountFromDetails = "0";
  Future getDiscountFromDetails()async{
    discountFromDetails = await Bill_Controller().getDiscount_from_Details(widget.xdornum);
    setState(() {loading=false;});
    //print(list);
  }

  String vatFromDetails = "0";
  Future getvatFromDetails()async{
    vatFromDetails = await Bill_Controller().getVat_from_Details(widget.xdornum);
    setState(() {loading=false;});
    //print(list);
  }

  String sdFromDetails = "0";
  Future getSDFromDetails()async{
    sdFromDetails = await Bill_Controller().getSD_from_Details(widget.xdornum);
    setState(() {loading=false;});
    //print(list);
  }

  String sumFromDetails = "0";
  Future getSumFromDetails()async{
    sumFromDetails = await Bill_Controller().getTotal_from_Details(widget.xdornum);
    setState(() {
      loading=false;
    });
    //print(list);
  }

  String netPayable = "0";
  double netPayable1 = 0.0;


  Future netPayCalculation()async{
    // netPayable = double.parse(sumFromDetails)+double.parse(vatFromDetails)-double.parse(discountFromDetails);
    // print("sumFromDetails"+sumFromDetails.toString());
    // print("vatFromDetails"+vatFromDetails.toString());
    // print("discountFromDetails"+discountFromDetails.toString());
    // print("netPayable"+netPayable.toString());
    netPayable = await Bill_Controller().getnetAmount_from_Details(widget.xdornum);
    netPayable1 = double.parse(netPayable) - double.parse(widget.spDiscount);
    setState(() {
      loading=false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    headerList();
    detailsList();
    getSumFromDetails();
    getSDFromDetails();
    getvatFromDetails();
    getDiscountFromDetails();
    netPayCalculation();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xffFAFAFA),
        title: Text(
          "Bill",
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
          height: size.height*2,
          width: size.width,
          padding: EdgeInsets.all(10),
          child: Column(

            children: [

              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BAO",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 30,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Chef's Table, Satarkul",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),

                ],
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hotline:",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                  Text(" 0125362",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("TAX INVOICE:",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                  Text("${widget.xdornum}",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),

              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 2,
                color: Colors.black,

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("BILL NO : ${widget.xdornum}",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.normal),
                  ),
                  Text("Mushak- 6.3",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 48,
                      fontWeight: FontWeight.w100),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 2,
                color: Colors.black,

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Description",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.bold),
                  ),
                  Text("Price",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.bold),
                  ),
                  Text("Qty",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.bold),
                  ),
                  Text("Amount",style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: size.height / 43,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),


              Divider(
                thickness: 2,
                color: Colors.black,

              ),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: detailslist.length==null?0:detailslist.length,
                    itemBuilder: (BuildContext context,index){
                      return  Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: FittedBox(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    child: Text("${index+1}. Item${detailslist[index]['xdesc']}",style: TextStyle(
                                        color: Color(0xff403B35),
                                        fontSize: size.height / 45,
                                        fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ),
                              Text("${detailslist[index]['xrate']}",style: TextStyle(
                                  color: Color(0xff403B35),
                                  fontSize: size.height / 45,
                                  fontWeight: FontWeight.normal),
                              ),
                              Text("${detailslist[index]['xqtyord']}",style: TextStyle(
                                  color: Color(0xff403B35),
                                  fontSize: size.height / 45,
                                  fontWeight: FontWeight.normal),
                              ),
                              Text("${detailslist[index]['xrate']}",style: TextStyle(
                                  color: Color(0xff403B35),
                                  fontSize: size.height / 45,
                                  fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      );

                    }),
              ),

              Divider(
                thickness: 2,
                color: Colors.black,

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("Sub Total",style: TextStyle(
                        color: Color(0xff403B35),
                        fontSize: size.height / 45,
                        fontWeight: FontWeight.normal),
                    ),
                  ),
                  Text("${sumFromDetails}",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("(+) VAT",style: TextStyle(
                        color: Color(0xff403B35),
                        fontSize: size.height / 45,
                        fontWeight: FontWeight.normal),
                    ),
                  ),
                  Text("${vatFromDetails}",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("(-) Discount",style: TextStyle(
                        color: Color(0xff403B35),
                        fontSize: size.height / 45,
                        fontWeight: FontWeight.normal),
                    ),
                  ),
                  Text("${discountFromDetails}",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("(-) Special Discount",style: TextStyle(
                        color: Color(0xff403B35),
                        fontSize: size.height / 45,
                        fontWeight: FontWeight.normal),
                    ),
                  ),
                  Text("${widget.spDiscount}",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),


              Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Container(
                  width: 300,
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,

                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("Net Payble",style: TextStyle(
                        color: Color(0xff403B35),
                        fontSize: size.height / 45,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("${netPayable1}",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("Total Paid",style: TextStyle(
                        color: Color(0xff403B35),
                        fontSize: size.height / 45,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("${netPayable1}",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text("Due",style: TextStyle(
                        color: Color(0xff403B35),
                        fontSize: size.height / 45,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("00.00",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Divider(
                thickness: 2,
                color: Colors.black,

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Terms & Conditions",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Terminal : 01",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                  Text("Date : 17-Nov-2022",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cashier : Zabadmin",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                  Text("Time : 4:07 PM",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.normal),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Center(
                  child: Container(
                    height: 100,
                    child: SfBarcodeGenerator(
                      value: 'DO05252015256325',
                      symbology: Code39(),
                      showValue: true,
                    ),
                  )),

              Divider(
                thickness: 2,
                color: Colors.black,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Customer : ",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.bold),
                  ),
                  Text("Hungry Naki",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 45,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Token No : ",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 40,
                      fontWeight: FontWeight.bold),
                  ),
                  Text("1004",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 40,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 2,
                color: Colors.black,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Thank you. Please come again",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 47,
                      fontWeight: FontWeight.bold),
                  ),

                ],
              ),

              Divider(
                thickness: 2,
                color: Colors.black,

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ZABPOS Powerd by Orange Solution Ltd.",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 47,
                      fontWeight: FontWeight.normal),
                  ),

                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("+8801284525",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 47,
                      fontWeight: FontWeight.normal),
                  ),

                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("facebook.com/makeitorange",style: TextStyle(
                      color: Color(0xff403B35),
                      fontSize: size.height / 47,
                      fontWeight: FontWeight.normal),
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