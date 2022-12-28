class Cart_add_Model {
  Cart_add_Model({
    required this.id,
    this.xdornum,
    required this.xitem,
    required this.xdesc,
    required this.xrate,
    required this.xlineamt,
    required this.product_qnty,
    required this.xdisc,
    required this.xvatamt,
    required this.xsupptaxamt
  });

  dynamic id;
  dynamic xdornum;
  String xitem;
  String xdesc;
  double xrate;
  double xlineamt;
  String product_qnty;
  double xdisc;
  double xvatamt;
  double xsupptaxamt;


  factory Cart_add_Model.fromJson(Map<String, dynamic> json) => Cart_add_Model(
    id: json["id"],
    xdornum: json["xdornum"],
    xitem: json["xitem"],
    xdesc: json["xdesc"],
    xrate: json["xrate"],
    xlineamt: json["xlineamt"],
    product_qnty: json["product_qnty"],
    xdisc: json["xdisc"],
    xvatamt: json["xvatamt"],
    xsupptaxamt: json["xsupptaxamt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "xdornum": xdornum,
    "xitem": xitem,
    "xdesc": xdesc,
    "xrate": xrate,
    "xlineamt": xlineamt,
    "product_qnty": product_qnty,
    "xdisc": xdisc,
    "xvatamt": xvatamt,
    "xsupptaxamt": xsupptaxamt,
  };
}