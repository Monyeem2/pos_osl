class Bill_details_add_Model {
  Bill_details_add_Model({
    required this.xdornum,
    required this.xrow,
    this.xaddonrow,
    required this.xdisc,
    required this.xdesc,
    required this.xdiscamt,
    required this.xdisctype,
    this.xdorrow,
    required this.xitem,
    required this.xlineamt,
    this.xnetamt,
    this.xnote,
    required this.xqtyord,
    required this.xrate,
    required this.xshopno,
    this.xstatusgl,
    required this.xsupptaxamt,
    required this.xsupptaxrate,
    this.xterminal,
    required this.xvatamt,
    required this.xvatrate,
    required this.zauserid,
    required this.zid,
    required this.ztime,
    required this.zutime,
    required this.zuuserid,
  });

  String xdornum;
  int xrow;
  dynamic xaddonrow;
  double xdisc;
  String xdesc;
  double xdiscamt;
  String xdisctype;
  dynamic xdorrow;
  String xitem;
  double xlineamt;
  dynamic xnetamt;
  dynamic xnote;
  String xqtyord;
  double xrate;
  String xshopno;
  dynamic xstatusgl;
  double xsupptaxamt;
  double xsupptaxrate;
  dynamic xterminal;
  double xvatamt;
  double xvatrate;
  String zauserid;
  int zid;
  String ztime;
  String zutime;
  String zuuserid;

  factory Bill_details_add_Model.fromJson(Map<String, dynamic> json) => Bill_details_add_Model(
    xdornum: json["xdornum"],
    xrow: json["xrow"],
    xaddonrow: json["xaddonrow"],
    xdisc: json["xdisc"],
    xdesc: json["xdesc"],
    xdiscamt: json["xdiscamt"],
    xdisctype: json["xdisctype"],
    xdorrow: json["xdorrow"],
    xitem: json["xitem"],
    xlineamt: json["xlineamt"],
    xnetamt: json["xnetamt"],
    xnote: json["xnote"],
    xqtyord: json["xqtyord"],
    xrate: json["xrate"],
    xshopno: json["xshopno"],
    xstatusgl: json["xstatusgl"],
    xsupptaxamt: json["xsupptaxamt"],
    xsupptaxrate: json["xsupptaxrate"],
    xterminal: json["xterminal"],
    xvatamt: json["xvatamt"],
    xvatrate: json["xvatrate"],
    zauserid: json["zauserid"],
    zid: json["zid"],
    ztime: json["ztime"],
    zutime: json["zutime"],
    zuuserid: json["zuuserid"],
  );

  Map<String, dynamic> toJson() => {
    "xdornum": xdornum,
    "xrow": xrow,
    "xaddonrow": xaddonrow,
    "xdisc": xdisc,
    "xdesc": xdesc,
    "xdiscamt": xdiscamt,
    "xdisctype": xdisctype,
    "xdorrow": xdorrow,
    "xitem": xitem,
    "xlineamt": xlineamt,
    "xnetamt": xnetamt,
    "xnote": xnote,
    "xqtyord": xqtyord,
    "xrate": xrate,
    "xshopno": xshopno,
    "xstatusgl": xstatusgl,
    "xsupptaxamt": xsupptaxamt,
    "xsupptaxrate": xsupptaxrate,
    "xterminal": xterminal,
    "xvatamt": xvatamt,
    "xvatrate": xvatrate,
    "zauserid": zauserid,
    "zid": zid,
    "ztime": ztime,
    "zutime": zutime,
    "zuuserid": zuuserid,
  };
}