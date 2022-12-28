// // // To parse this JSON data, do
// // //
// // //     final fooddata = fooddataFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // List<Fooddata> fooddataFromJson(String str) => List<Fooddata>.from(json.decode(str).map((x) => Fooddata.fromJson(x)));
// //
// // String fooddataToJson(List<Fooddata> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// //
// // class Fooddata {
// //   Fooddata({
// //     required this.xitem,
// //     required this.hscode,
// //     required this.xalias,
// //     required this.xautogrn,
// //     required this.xbimage,
// //     required this.xbin,
// //     required this.xbnprintstatus,
// //     required this.xbodycode,
// //     required this.xbrand,
// //     required this.xcartoon,
// //     required this.xcatitem,
// //     required this.xcfiss,
// //     required this.xcfpck,
// //     required this.xcfpur,
// //     required this.xcfsel,
// //     required this.xcitem,
// //     required this.xcodeold,
// //     required this.xcost,
// //     required this.xcountry,
// //     required this.xcus,
// //     required this.xdatecreate,
// //     required this.xdateeff,
// //     required this.xdateexp,
// //     required this.xdealerp,
// //     required this.xdesc,
// //     required this.xdisc,
// //     required this.xdiscstatus,
// //     required this.xdisctype,
// //     required this.xdornum,
// //     required this.xendtime,
// //     required this.xgitem,
// //     required this.xgrade,
// //     required this.xgritem,
// //     required this.xhscode,
// //     required this.xitemdept,
// //     required this.xitemsubdept,
// //     required this.xlmax,
// //     required this.xlmin,
// //     required this.xlong,
// //     required this.xminqty,
// //     required this.xmodel,
// //     required this.xmrp,
// //     required this.xpacking,
// //     required this.xpackqty,
// //     required this.xpackweightnet,
// //     required this.xpartno,
// //     required this.xpnature,
// //     required this.xpsize,
// //     required this.xrate,
// //     required this.xrateexp,
// //     required this.xreordlvl,
// //     required this.xsdcat,
// //     required this.xserialnum,
// //     required this.xserialtype,
// //     required this.xsetmenustatus,
// //     required this.xshelf,
// //     required this.xshopno,
// //     required this.xspecification,
// //     required this.xstarttime,
// //     required this.xstype,
// //     required this.xsubcat,
// //     required this.xsupptaxamt,
// //     required this.xsupptaxrate,
// //     required this.xtaxrate,
// //     required this.xtheircode,
// //     required this.xtitem,
// //     required this.xtype,
// //     required this.xtypeitem,
// //     required this.xunit,
// //     required this.xunitiss,
// //     required this.xunitpck,
// //     required this.xunitpur,
// //     required this.xunitsel,
// //     required this.xvatamt,
// //     required this.xvatcat,
// //     required this.xvatrate,
// //     required this.xwper,
// //     required this.zactive,
// //     required this.zauserid,
// //     required this.zid,
// //     required this.zuuserid,
// //   });
// //
// //   String? xitem;
// //   String? hscode;
// //   dynamic xalias;
// //   dynamic xautogrn;
// //   String? xbimage;
// //   dynamic xbin;
// //   dynamic xbnprintstatus;
// //   dynamic xbodycode;
// //   dynamic xbrand;
// //   dynamic xcartoon;
// //   dynamic xcatitem;
// //   dynamic xcfiss;
// //   dynamic xcfpck;
// //   dynamic xcfpur;
// //   dynamic xcfsel;
// //   String? xcitem;
// //   dynamic xcodeold;
// //   String? xcost;
// //   dynamic xcountry;
// //   dynamic xcus;
// //   dynamic xdatecreate;
// //   dynamic xdateeff;
// //   dynamic xdateexp;
// //   String? xdealerp;
// //   String? xdesc;
// //   String? xdisc;
// //   String? xdiscstatus;
// //   String? xdisctype;
// //   dynamic xdornum;
// //   dynamic xendtime;
// //   dynamic xgitem;
// //   dynamic xgrade;
// //   dynamic xgritem;
// //   String? xhscode;
// //   dynamic xitemdept;
// //   dynamic xitemsubdept;
// //   dynamic xlmax;
// //   dynamic xlmin;
// //   dynamic xlong;
// //   dynamic xminqty;
// //   dynamic xmodel;
// //   dynamic xmrp;
// //   dynamic xpacking;
// //   dynamic xpackqty;
// //   dynamic xpackweightnet;
// //   dynamic xpartno;
// //   dynamic xpnature;
// //   dynamic xpsize;
// //   String? xrate;
// //   dynamic xrateexp;
// //   dynamic xreordlvl;
// //   String? xsdcat;
// //   dynamic xserialnum;
// //   dynamic xserialtype;
// //   String? xsetmenustatus;
// //   dynamic xshelf;
// //   String? xshopno;
// //   dynamic xspecification;
// //   dynamic xstarttime;
// //   dynamic xstype;
// //   dynamic xsubcat;
// //   String? xsupptaxamt;
// //   String? xsupptaxrate;
// //   dynamic xtaxrate;
// //   dynamic xtheircode;
// //   dynamic xtitem;
// //   String? xtype;
// //   String? xtypeitem;
// //   String? xunit;
// //   dynamic xunitiss;
// //   dynamic xunitpck;
// //   dynamic xunitpur;
// //   dynamic xunitsel;
// //   String? xvatamt;
// //   String? xvatcat;
// //   String? xvatrate;
// //   dynamic xwper;
// //   String? zactive;
// //   String? zauserid;
// //   int? zid;
// //   String? zuuserid;
// //
// //   factory Fooddata.fromJson(Map<String, dynamic> json) => Fooddata(
// //     xitem: json["xitem"] == null ? null : json["xitem"],
// //     hscode: json["hscode"] == null ? null : json["hscode"],
// //     xalias: json["xalias"],
// //     xautogrn: json["xautogrn"],
// //     xbimage: json["xbimage"] == null ? null : json["xbimage"],
// //     xbin: json["xbin"],
// //     xbnprintstatus: json["xbnprintstatus"],
// //     xbodycode: json["xbodycode"],
// //     xbrand: json["xbrand"],
// //     xcartoon: json["xcartoon"],
// //     xcatitem: json["xcatitem"],
// //     xcfiss: json["xcfiss"],
// //     xcfpck: json["xcfpck"],
// //     xcfpur: json["xcfpur"],
// //     xcfsel: json["xcfsel"],
// //     xcitem: json["xcitem"] == null ? null : json["xcitem"],
// //     xcodeold: json["xcodeold"],
// //     xcost: json["xcost"] == null ? null : json["xcost"],
// //     xcountry: json["xcountry"],
// //     xcus: json["xcus"],
// //     xdatecreate: json["xdatecreate"],
// //     xdateeff: json["xdateeff"],
// //     xdateexp: json["xdateexp"],
// //     xdealerp: json["xdealerp"] == null ? null : json["xdealerp"],
// //     xdesc: json["xdesc"] == null ? null : json["xdesc"],
// //     xdisc: json["xdisc"] == null ? null : json["xdisc"],
// //     xdiscstatus: json["xdiscstatus"] == null ? null : json["xdiscstatus"],
// //     xdisctype: json["xdisctype"] == null ? null : json["xdisctype"],
// //     xdornum: json["xdornum"],
// //     xendtime: json["xendtime"],
// //     xgitem: json["xgitem"],
// //     xgrade: json["xgrade"],
// //     xgritem: json["xgritem"],
// //     xhscode: json["xhscode"] == null ? null : json["xhscode"],
// //     xitemdept: json["xitemdept"],
// //     xitemsubdept: json["xitemsubdept"],
// //     xlmax: json["xlmax"],
// //     xlmin: json["xlmin"],
// //     xlong: json["xlong"],
// //     xminqty: json["xminqty"],
// //     xmodel: json["xmodel"],
// //     xmrp: json["xmrp"],
// //     xpacking: json["xpacking"],
// //     xpackqty: json["xpackqty"],
// //     xpackweightnet: json["xpackweightnet"],
// //     xpartno: json["xpartno"],
// //     xpnature: json["xpnature"],
// //     xpsize: json["xpsize"],
// //     xrate: json["xrate"] == null ? null : json["xrate"],
// //     xrateexp: json["xrateexp"],
// //     xreordlvl: json["xreordlvl"],
// //     xsdcat: json["xsdcat"] == null ? null : json["xsdcat"],
// //     xserialnum: json["xserialnum"],
// //     xserialtype: json["xserialtype"],
// //     xsetmenustatus: json["xsetmenustatus"] == null ? null : json["xsetmenustatus"],
// //     xshelf: json["xshelf"],
// //     xshopno: json["xshopno"] == null ? null : json["xshopno"],
// //     xspecification: json["xspecification"],
// //     xstarttime: json["xstarttime"],
// //     xstype: json["xstype"],
// //     xsubcat: json["xsubcat"],
// //     xsupptaxamt: json["xsupptaxamt"] == null ? null : json["xsupptaxamt"],
// //     xsupptaxrate: json["xsupptaxrate"] == null ? null : json["xsupptaxrate"],
// //     xtaxrate: json["xtaxrate"],
// //     xtheircode: json["xtheircode"],
// //     xtitem: json["xtitem"],
// //     xtype: json["xtype"] == null ? null : json["xtype"],
// //     xtypeitem: json["xtypeitem"] == null ? null : json["xtypeitem"],
// //     xunit: json["xunit"] == null ? null : json["xunit"],
// //     xunitiss: json["xunitiss"],
// //     xunitpck: json["xunitpck"],
// //     xunitpur: json["xunitpur"],
// //     xunitsel: json["xunitsel"],
// //     xvatamt: json["xvatamt"] == null ? null : json["xvatamt"],
// //     xvatcat: json["xvatcat"] == null ? null : json["xvatcat"],
// //     xvatrate: json["xvatrate"] == null ? null : json["xvatrate"],
// //     xwper: json["xwper"],
// //     zactive: json["zactive"] == null ? null : json["zactive"],
// //     zauserid: json["zauserid"] == null ? null : json["zauserid"],
// //     zid: json["zid"] == null ? null : json["zid"],
// //     zuuserid: json["zuuserid"] == null ? null : json["zuuserid"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "xitem": xitem == null ? null : xitem,
// //     "hscode": hscode == null ? null : hscode,
// //     "xalias": xalias,
// //     "xautogrn": xautogrn,
// //     "xbimage": xbimage == null ? null : xbimage,
// //     "xbin": xbin,
// //     "xbnprintstatus": xbnprintstatus,
// //     "xbodycode": xbodycode,
// //     "xbrand": xbrand,
// //     "xcartoon": xcartoon,
// //     "xcatitem": xcatitem,
// //     "xcfiss": xcfiss,
// //     "xcfpck": xcfpck,
// //     "xcfpur": xcfpur,
// //     "xcfsel": xcfsel,
// //     "xcitem": xcitem == null ? null : xcitem,
// //     "xcodeold": xcodeold,
// //     "xcost": xcost == null ? null : xcost,
// //     "xcountry": xcountry,
// //     "xcus": xcus,
// //     "xdatecreate": xdatecreate,
// //     "xdateeff": xdateeff,
// //     "xdateexp": xdateexp,
// //     "xdealerp": xdealerp == null ? null : xdealerp,
// //     "xdesc": xdesc == null ? null : xdesc,
// //     "xdisc": xdisc == null ? null : xdisc,
// //     "xdiscstatus": xdiscstatus == null ? null : xdiscstatus,
// //     "xdisctype": xdisctype == null ? null : xdisctype,
// //     "xdornum": xdornum,
// //     "xendtime": xendtime,
// //     "xgitem": xgitem,
// //     "xgrade": xgrade,
// //     "xgritem": xgritem,
// //     "xhscode": xhscode == null ? null : xhscode,
// //     "xitemdept": xitemdept,
// //     "xitemsubdept": xitemsubdept,
// //     "xlmax": xlmax,
// //     "xlmin": xlmin,
// //     "xlong": xlong,
// //     "xminqty": xminqty,
// //     "xmodel": xmodel,
// //     "xmrp": xmrp,
// //     "xpacking": xpacking,
// //     "xpackqty": xpackqty,
// //     "xpackweightnet": xpackweightnet,
// //     "xpartno": xpartno,
// //     "xpnature": xpnature,
// //     "xpsize": xpsize,
// //     "xrate": xrate == null ? null : xrate,
// //     "xrateexp": xrateexp,
// //     "xreordlvl": xreordlvl,
// //     "xsdcat": xsdcat == null ? null : xsdcat,
// //     "xserialnum": xserialnum,
// //     "xserialtype": xserialtype,
// //     "xsetmenustatus": xsetmenustatus == null ? null : xsetmenustatus,
// //     "xshelf": xshelf,
// //     "xshopno": xshopno == null ? null : xshopno,
// //     "xspecification": xspecification,
// //     "xstarttime": xstarttime,
// //     "xstype": xstype,
// //     "xsubcat": xsubcat,
// //     "xsupptaxamt": xsupptaxamt == null ? null : xsupptaxamt,
// //     "xsupptaxrate": xsupptaxrate == null ? null : xsupptaxrate,
// //     "xtaxrate": xtaxrate,
// //     "xtheircode": xtheircode,
// //     "xtitem": xtitem,
// //     "xtype": xtype == null ? null : xtype,
// //     "xtypeitem": xtypeitem == null ? null : xtypeitem,
// //     "xunit": xunit == null ? null : xunit,
// //     "xunitiss": xunitiss,
// //     "xunitpck": xunitpck,
// //     "xunitpur": xunitpur,
// //     "xunitsel": xunitsel,
// //     "xvatamt": xvatamt == null ? null : xvatamt,
// //     "xvatcat": xvatcat == null ? null : xvatcat,
// //     "xvatrate": xvatrate == null ? null : xvatrate,
// //     "xwper": xwper,
// //     "zactive": zactive == null ? null : zactive,
// //     "zauserid": zauserid == null ? null : zauserid,
// //     "zid": zid == null ? null : zid,
// //     "zuuserid": zuuserid == null ? null : zuuserid,
// //   };
// // }
//
//
// // To parse this JSON data, do
// //
// //     final itemInfoModel = itemInfoModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<ItemInfoModel> itemInfoModelFromJson(String str) => List<ItemInfoModel>.from(json.decode(str).map((x) => ItemInfoModel.fromJson(x)));
//
// String itemInfoModelToJson(List<ItemInfoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ItemInfoModel {
//   ItemInfoModel({
//     required required this.xitem,
//     required required this.hscode,
//     required this.xalias,
//     required this.xautogrn,
//     required required this.xbimage,
//     required this.xbin,
//     required this.xbnprintstatus,
//     required this.xbodycode,
//     required this.xbrand,
//     required this.xcartoon,
//     required this.xcatitem,
//     required this.xcfiss,
//     required this.xcfpck,
//     required this.xcfpur,
//     required this.xcfsel,
//     required required this.xcitem,
//     required this.xcodeold,
//     required required this.xcost,
//     required this.xcountry,
//     required this.xcus,
//     required this.xdatecreate,
//     required this.xdateeff,
//     required this.xdateexp,
//     required required this.xdealerp,
//     required required this.xdesc,
//     required required this.xdisc,
//     required required this.xdiscstatus,
//     required required this.xdisctype,
//     required this.xdornum,
//     required this.xendtime,
//     required this.xgitem,
//     required this.xgrade,
//     required this.xgritem,
//     required required this.xhscode,
//     required this.xitemdept,
//     required this.xitemsubdept,
//     required this.xlmax,
//     required this.xlmin,
//     required this.xlong,
//     required this.xminqty,
//     required this.xmodel,
//     required this.xmrp,
//     required this.xpacking,
//     required this.xpackqty,
//     required this.xpackweightnet,
//     required this.xpartno,
//     required this.xpnature,
//     required this.xpsize,
//     required required this.xrate,
//     required this.xrateexp,
//     required this.xreordlvl,
//     required required this.xsdcat,
//     required this.xserialnum,
//     required this.xserialtype,
//     required required this.xsetmenustatus,
//     required this.xshelf,
//     required required this.xshopno,
//     required this.xspecification,
//     required this.xstarttime,
//     required this.xstype,
//     required this.xsubcat,
//     required required this.xsupptaxamt,
//     required required this.xsupptaxrate,
//     required this.xtaxrate,
//     required this.xtheircode,
//     required this.xtitem,
//     required required this.xtype,
//     required required this.xtypeitem,
//     required required this.xunit,
//     required this.xunitiss,
//     required this.xunitpck,
//     required this.xunitpur,
//     required this.xunitsel,
//     required required this.xvatamt,
//     required required this.xvatcat,
//     required required this.xvatrate,
//     required this.xwper,
//     required required this.zactive,
//     required required this.zauserid,
//     required required this.zid,
//     required required this.zuuserid,
//   });
//
//   String xitem;
//   String hscode;
//   dynamic xalias;
//   dynamic xautogrn;
//   String xbimage;
//   dynamic xbin;
//   dynamic xbnprintstatus;
//   dynamic xbodycode;
//   dynamic xbrand;
//   dynamic xcartoon;
//   dynamic xcatitem;
//   dynamic xcfiss;
//   dynamic xcfpck;
//   dynamic xcfpur;
//   dynamic xcfsel;
//   String xcitem;
//   dynamic xcodeold;
//   String xcost;
//   dynamic xcountry;
//   dynamic xcus;
//   dynamic xdatecreate;
//   dynamic xdateeff;
//   dynamic xdateexp;
//   String xdealerp;
//   String xdesc;
//   String xdisc;
//   String xdiscstatus;
//   String xdisctype;
//   dynamic xdornum;
//   dynamic xendtime;
//   dynamic xgitem;
//   dynamic xgrade;
//   dynamic xgritem;
//   String xhscode;
//   dynamic xitemdept;
//   dynamic xitemsubdept;
//   dynamic xlmax;
//   dynamic xlmin;
//   dynamic xlong;
//   dynamic xminqty;
//   dynamic xmodel;
//   dynamic xmrp;
//   dynamic xpacking;
//   dynamic xpackqty;
//   dynamic xpackweightnet;
//   dynamic xpartno;
//   dynamic xpnature;
//   dynamic xpsize;
//   String xrate;
//   dynamic xrateexp;
//   dynamic xreordlvl;
//   String xsdcat;
//   dynamic xserialnum;
//   dynamic xserialtype;
//   String xsetmenustatus;
//   dynamic xshelf;
//   String xshopno;
//   dynamic xspecification;
//   dynamic xstarttime;
//   dynamic xstype;
//   dynamic xsubcat;
//   String xsupptaxamt;
//   String xsupptaxrate;
//   dynamic xtaxrate;
//   dynamic xtheircode;
//   dynamic xtitem;
//   String xtype;
//   String xtypeitem;
//   String xunit;
//   dynamic xunitiss;
//   dynamic xunitpck;
//   dynamic xunitpur;
//   dynamic xunitsel;
//   String xvatamt;
//   String xvatcat;
//   String xvatrate;
//   dynamic xwper;
//   String zactive;
//   String zauserid;
//   int zid;
//   String zuuserid;
//
//   factory ItemInfoModel.fromJson(Map<String, dynamic> json) => ItemInfoModel(
//     xitem: json["xitem"],
//     hscode: json["hscode"],
//     xalias: json["xalias"],
//     xautogrn: json["xautogrn"],
//     xbimage: json["xbimage"],
//     xbin: json["xbin"],
//     xbnprintstatus: json["xbnprintstatus"],
//     xbodycode: json["xbodycode"],
//     xbrand: json["xbrand"],
//     xcartoon: json["xcartoon"],
//     xcatitem: json["xcatitem"],
//     xcfiss: json["xcfiss"],
//     xcfpck: json["xcfpck"],
//     xcfpur: json["xcfpur"],
//     xcfsel: json["xcfsel"],
//     xcitem: json["xcitem"],
//     xcodeold: json["xcodeold"],
//     xcost: json["xcost"],
//     xcountry: json["xcountry"],
//     xcus: json["xcus"],
//     xdatecreate: json["xdatecreate"],
//     xdateeff: json["xdateeff"],
//     xdateexp: json["xdateexp"],
//     xdealerp: json["xdealerp"],
//     xdesc: json["xdesc"],
//     xdisc: json["xdisc"],
//     xdiscstatus: json["xdiscstatus"],
//     xdisctype: json["xdisctype"],
//     xdornum: json["xdornum"],
//     xendtime: json["xendtime"],
//     xgitem: json["xgitem"],
//     xgrade: json["xgrade"],
//     xgritem: json["xgritem"],
//     xhscode: json["xhscode"],
//     xitemdept: json["xitemdept"],
//     xitemsubdept: json["xitemsubdept"],
//     xlmax: json["xlmax"],
//     xlmin: json["xlmin"],
//     xlong: json["xlong"],
//     xminqty: json["xminqty"],
//     xmodel: json["xmodel"],
//     xmrp: json["xmrp"],
//     xpacking: json["xpacking"],
//     xpackqty: json["xpackqty"],
//     xpackweightnet: json["xpackweightnet"],
//     xpartno: json["xpartno"],
//     xpnature: json["xpnature"],
//     xpsize: json["xpsize"],
//     xrate: json["xrate"],
//     xrateexp: json["xrateexp"],
//     xreordlvl: json["xreordlvl"],
//     xsdcat: json["xsdcat"],
//     xserialnum: json["xserialnum"],
//     xserialtype: json["xserialtype"],
//     xsetmenustatus: json["xsetmenustatus"],
//     xshelf: json["xshelf"],
//     xshopno: json["xshopno"],
//     xspecification: json["xspecification"],
//     xstarttime: json["xstarttime"],
//     xstype: json["xstype"],
//     xsubcat: json["xsubcat"],
//     xsupptaxamt: json["xsupptaxamt"],
//     xsupptaxrate: json["xsupptaxrate"],
//     xtaxrate: json["xtaxrate"],
//     xtheircode: json["xtheircode"],
//     xtitem: json["xtitem"],
//     xtype: json["xtype"],
//     xtypeitem: json["xtypeitem"],
//     xunit: json["xunit"],
//     xunitiss: json["xunitiss"],
//     xunitpck: json["xunitpck"],
//     xunitpur: json["xunitpur"],
//     xunitsel: json["xunitsel"],
//     xvatamt: json["xvatamt"],
//     xvatcat: json["xvatcat"],
//     xvatrate: json["xvatrate"],
//     xwper: json["xwper"],
//     zactive: json["zactive"],
//     zauserid: json["zauserid"],
//     zid: json["zid"],
//     zuuserid: json["zuuserid"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "xitem": xitem,
//     "hscode": hscode,
//     "xalias": xalias,
//     "xautogrn": xautogrn,
//     "xbimage": xbimage,
//     "xbin": xbin,
//     "xbnprintstatus": xbnprintstatus,
//     "xbodycode": xbodycode,
//     "xbrand": xbrand,
//     "xcartoon": xcartoon,
//     "xcatitem": xcatitem,
//     "xcfiss": xcfiss,
//     "xcfpck": xcfpck,
//     "xcfpur": xcfpur,
//     "xcfsel": xcfsel,
//     "xcitem": xcitem,
//     "xcodeold": xcodeold,
//     "xcost": xcost,
//     "xcountry": xcountry,
//     "xcus": xcus,
//     "xdatecreate": xdatecreate,
//     "xdateeff": xdateeff,
//     "xdateexp": xdateexp,
//     "xdealerp": xdealerp,
//     "xdesc": xdesc,
//     "xdisc": xdisc,
//     "xdiscstatus": xdiscstatus,
//     "xdisctype": xdisctype,
//     "xdornum": xdornum,
//     "xendtime": xendtime,
//     "xgitem": xgitem,
//     "xgrade": xgrade,
//     "xgritem": xgritem,
//     "xhscode": xhscode,
//     "xitemdept": xitemdept,
//     "xitemsubdept": xitemsubdept,
//     "xlmax": xlmax,
//     "xlmin": xlmin,
//     "xlong": xlong,
//     "xminqty": xminqty,
//     "xmodel": xmodel,
//     "xmrp": xmrp,
//     "xpacking": xpacking,
//     "xpackqty": xpackqty,
//     "xpackweightnet": xpackweightnet,
//     "xpartno": xpartno,
//     "xpnature": xpnature,
//     "xpsize": xpsize,
//     "xrate": xrate,
//     "xrateexp": xrateexp,
//     "xreordlvl": xreordlvl,
//     "xsdcat": xsdcat,
//     "xserialnum": xserialnum,
//     "xserialtype": xserialtype,
//     "xsetmenustatus": xsetmenustatus,
//     "xshelf": xshelf,
//     "xshopno": xshopno,
//     "xspecification": xspecification,
//     "xstarttime": xstarttime,
//     "xstype": xstype,
//     "xsubcat": xsubcat,
//     "xsupptaxamt": xsupptaxamt,
//     "xsupptaxrate": xsupptaxrate,
//     "xtaxrate": xtaxrate,
//     "xtheircode": xtheircode,
//     "xtitem": xtitem,
//     "xtype": xtype,
//     "xtypeitem": xtypeitem,
//     "xunit": xunit,
//     "xunitiss": xunitiss,
//     "xunitpck": xunitpck,
//     "xunitpur": xunitpur,
//     "xunitsel": xunitsel,
//     "xvatamt": xvatamt,
//     "xvatcat": xvatcat,
//     "xvatrate": xvatrate,
//     "xwper": xwper,
//     "zactive": zactive,
//     "zauserid": zauserid,
//     "zid": zid,
//     "zuuserid": zuuserid,
//   };
// }


// To parse this JSON data, do
//
//     final itemInfoModel = itemInfoModelFromJson(jsonString);

import 'dart:convert';

List<ItemInfoModel> itemInfoModelFromJson(String str) => List<ItemInfoModel>.from(json.decode(str).map((x) => ItemInfoModel.fromJson(x)));

String itemInfoModelToJson(List<ItemInfoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemInfoModel {
  ItemInfoModel({
    required this.xitem,
    required this.xbimage,
    required this.xcitem,
    required this.xdesc,
    required this.xdisc,
    required this.xdisctype,
    required this.xhscode,
    required this.xrate,
    required this.xsdcat,
    required this.xsetmenustatus,
    required this.xshopno,
    required this.xsubcat,
    required this.xsupptaxamt,
    required this.xsupptaxrate,
    required this.xtype,
    required this.xtypeitem,
    required this.xunit,
    required this.xvatamt,
    required this.xvatcat,
    required this.xvatrate,
    required this.zactive,
    required this.zauserid,
    required this.zid,
    required this.zuuserid,
  });

  String xitem;
  String xbimage;
  String xcitem;
  String xdesc;
  String xdisc;
  String xdisctype;
  String xhscode;
  String xrate;
  String xsdcat;
  String xsetmenustatus;
  String xshopno;
  dynamic xsubcat;
  String xsupptaxamt;
  String xsupptaxrate;
  String xtype;
  String xtypeitem;
  String xunit;
  String xvatamt;
  String xvatcat;
  String xvatrate;
  String zactive;
  String zauserid;
  int zid;
  String zuuserid;

  factory ItemInfoModel.fromJson(Map<String, dynamic> json) => ItemInfoModel(
    xitem: json["xitem"],
    xbimage: json["xbimage"],
    xcitem: json["xcitem"],
    xdesc: json["xdesc"],
    xdisc: json["xdisc"],
    xdisctype: json["xdisctype"],
    xhscode: json["xhscode"],
    xrate: json["xrate"],
    xsdcat: json["xsdcat"],
    xsetmenustatus: json["xsetmenustatus"],
    xshopno: json["xshopno"],
    xsubcat: json["xsubcat"],
    xsupptaxamt: json["xsupptaxamt"],
    xsupptaxrate: json["xsupptaxrate"],
    xtype: json["xtype"],
    xtypeitem: json["xtypeitem"],
    xunit: json["xunit"],
    xvatamt: json["xvatamt"],
    xvatcat: json["xvatcat"],
    xvatrate: json["xvatrate"],
    zactive: json["zactive"],
    zauserid: json["zauserid"],
    zid: json["zid"],
    zuuserid: json["zuuserid"],
  );

  Map<String, dynamic> toJson() => {
    "xitem": xitem,
    "xbimage": xbimage,
    "xcitem": xcitem,
    "xdesc": xdesc,
    "xdisc": xdisc,
    "xdisctype": xdisctype,
    "xhscode": xhscode,
    "xrate": xrate,
    "xsdcat": xsdcat,
    "xsetmenustatus": xsetmenustatus,
    "xshopno": xshopno,
    "xsubcat": xsubcat,
    "xsupptaxamt": xsupptaxamt,
    "xsupptaxrate": xsupptaxrate,
    "xtype": xtype,
    "xtypeitem": xtypeitem,
    "xunit": xunit,
    "xvatamt": xvatamt,
    "xvatcat": xvatcat,
    "xvatrate": xvatrate,
    "zactive": zactive,
    "zauserid": zauserid,
    "zid": zid,
    "zuuserid": zuuserid,
  };
}
