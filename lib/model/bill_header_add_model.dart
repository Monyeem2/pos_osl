
class Bill_header_add_Model {
  Bill_header_add_Model({
    required this.xdornum,
    this.xacashamt,
    this.xacrdamt,
    required this.xamount,
    this.xbonuspoints,
    required this.xcardamt,
    required this.xcardno,
    required this.xcardtype,
    required this.xcashamt,
    required this.xchange,
    required this.xcus,
    required this.xdate,
    this.xdisc,
    required this.xdiscamt,
    this.xdiscf,
    this.xdiv,
    this.xexpamt,
    this.xfield,
    this.xnetamt,
    this.xnote,
    this.xnote1,
    required this.xpaid,
    this.xpaymentterm,
    this.xpaymenttype,
    required this.xpaytype,
    this.xperson,
    this.xref,
    this.xroundingchange,
    this.xshift,
    required this.xshopno,
    required this.xstatusprint,
    this.xsupptaxamt,
    this.xterminal,
    required this.xtotamt,
    required this.xvatamt,
    required this.xworkingdate,
    required this.zauserid,
    this.zid,
    required this.ztime,
    required this.zutime,
    required this.zuuserid


  });


      String xdornum;
      dynamic xacashamt;
      dynamic xacrdamt;
      double xamount;
      dynamic xbonuspoints;
      double xcardamt;
      String xcardno;
      String xcardtype;
      double xcashamt;
      double xchange;
      String xcus;
      String xdate;
      dynamic xdisc;
      double xdiscamt;
      dynamic xdiscf;
      dynamic xdiv;
      dynamic xexpamt;
      dynamic xfield;
      dynamic xnetamt;
      dynamic xnote;
      dynamic xnote1;
      double xpaid;
      dynamic xpaymentterm;
      dynamic xpaymenttype;
      String xpaytype;
      dynamic xperson;
      dynamic xref;
      dynamic xroundingchange;
      dynamic xshift;
      String xshopno;
      String xstatusprint;
      dynamic xsupptaxamt;
      dynamic xterminal;
      double xtotamt;
      double xvatamt;
      String xworkingdate;
      String zauserid;
      dynamic zid;
      String ztime;
      String zutime;
      String zuuserid;


  factory Bill_header_add_Model.fromJson(Map<String, dynamic> json) => Bill_header_add_Model(

      xdornum: json["xdornum"],
      xacashamt: json["xacashamt"],
      xacrdamt: json["xacrdamt"],
      xamount: json["xamount"],
      xbonuspoints: json["xbonuspoints"],
      xcardamt: json["xcardamt"],
      xcardno: json["xcardno"],
      xcardtype: json["xcardtype"],
      xcashamt: json["xcashamt"],
      xchange: json["xchange"],
      xcus: json["xcus"],
      xdate: json["xdate"],
      xdisc: json["xdisc"],
      xdiscamt: json["xdiscamt"],
      xdiscf: json["xdiscf"],
      xdiv: json["xdiv"],
      xexpamt: json["xexpamt"],
      xfield: json["xfield"],
      xnetamt: json["xnetamt"],
      xnote: json["xnote"],
      xnote1: json["xnote1"],
      xpaid: json["xpaid"],
      xpaymentterm: json["xpaymentterm"],
      xpaymenttype: json["xpaymenttype"],
      xpaytype: json["xpaytype"],
      xperson: json["xperson"],
      xref: json["xref"],
      xroundingchange: json["xroundingchange"],
      xshift: json["xshift"],
      xshopno: json["xshopno"],
      xstatusprint: json["xstatusprint"],
      xsupptaxamt: json["xsupptaxamt"],
      xterminal: json["xterminal"],
      xtotamt: json["xtotamt"],
      xvatamt: json["xvatamt"],
      xworkingdate: json["xworkingdate"],
      zauserid: json["zauserid"],
      zid: json["zid"],
      ztime: json["ztime"],
      zutime: json["zutime"],
      zuuserid: json["zuuserid"],
  );

  Map<String, dynamic> toJson() => {
    "xdornum": xdornum,
    "xacashamt": xacashamt,
    "xacrdamt": xacrdamt,
    "xamount": xamount,
    "xbonuspoints": xbonuspoints,
    "xcardamt": xcardamt,
    "xcardno": xcardno,
    "xcardtype": xcardtype,
    "xcashamt": xcashamt,
    "xchange": xchange,
    "xcus": xcus,
    "xdate": xdate,
    "xdisc": xdisc,
    "xdiscamt": xdiscamt,
    "xdiscf": xdiscf,
    "xdiv": xdiv,
    "xexpamt": xexpamt,
    "xfield": xfield,
    "xnetamt": xnetamt,
    "xnote": xnote,
    "xnote1": xnote1,
    "xpaid": xpaid,
    "xpaymentterm": xpaymentterm,
    "xpaymenttype": xpaymenttype,
    "xpaytype": xpaytype,
    "xperson": xperson,
    "xref": xref,
    "xroundingchange": xroundingchange,
    "xshift": xshift,
    "xshopno": xshopno,
    "xstatusprint": xstatusprint,
    "xsupptaxamt": xsupptaxamt,
    "xterminal": xterminal,
    "xtotamt": xtotamt,
    "xvatamt": xvatamt,
    "xworkingdate": xworkingdate,
    "zauserid": zauserid,
    "zid": zid,
    "ztime": ztime,
    "zutime": zutime,
    "zuuserid": zuuserid,
  };
}
