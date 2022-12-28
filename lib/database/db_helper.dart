import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/fooddata.dart';


class SqfliteDatabaseHelper {

  SqfliteDatabaseHelper.internal();
  static final SqfliteDatabaseHelper instance = new SqfliteDatabaseHelper.internal();
  factory SqfliteDatabaseHelper() => instance;

  //table
  static final productTable = 'caitem';
  static final cartTable = 'cart';
  static final orderDetailsTable = 'opdodetail';
  static final orderHeaderTable = 'opdoheader';
  static final _version = 1;

  static Database? _db;


  Future<Database?> get db async {
    if (_db !=null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb()async{
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path,'pos.db');
    print(dbPath);
    var openDb = await openDatabase(dbPath,version: _version,
        onCreate: (Database db,int version)async{
          await db.execute("""
          CREATE TABLE $productTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          xitem TEXT NOT NULL,
          xbimage TEXT,
	        xcitem TEXT,
	        xdesc TEXT,
	        xdisc REAL,
	        xdisctype TEXT,
	        xhscode TEXT,
	        xrate REAL, 
	        xsdcat TEXT, 
	        xsetmenustatus TEXT, 
	        xshopno TEXT, 
	        xsubcat TEXT, 
	        xsupptaxamt REAL, 
	        xsupptaxrate REAL, 
	        xtype TEXT, 
	        xtypeitem TEXT, 
	        xunit TEXT, 
	        xvatamt REAL,
	        xvatcat TEXT,
	        xvatrate REAL,
	        zactive TEXT,
	        zauserid TEXT,
	        zid INTEGER,
	        ztime TEXT,
	        zutime TEXT,
	        zuuserid TEXT
          )
          """);

          await db.execute("""
          CREATE TABLE $cartTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          xdornum TEXT,
          xitem TEXT NOT NULL,
          xdesc TEXT,
	        xrate REAL,
	        xlineamt REAL,
	        product_qnty INTEGER,
	        xdisc REAL,
	        xvatamt REAL,
	        xsupptaxamt REAL
          )
          """);


          await db.execute("""
          CREATE TABLE $orderDetailsTable(
	          xdornum TEXT,
            xrow INTEGER,
            xaddonrow INTEGER,
            xdisc REAL,
            xdesc REAL,
            xdiscamt REAL,
            xdisctype TEXT,
            xdorrow INTEGER,
            xitem TEXT,
            xlineamt REAL,
            xnetamt REAL,
            xnote TEXT,
            xqtyord REAL,
            xrate REAL,
            xshopno TEXT,
            xstatusgl TEXT,
            xsupptaxamt REAL,
            xsupptaxrate REAL,
            xterminal TEXT,
            xvatamt REAL,
            xvatrate REAL,
            zauserid TEXT,
            zid INTEGER,
            ztime TEXT,
            zutime TEXT,
            zuuserid TEXT
          )
          """);

          await db.execute("""
          CREATE TABLE $orderHeaderTable(
            xdornum TEXT,
            xacashamt REAL,
            xacrdamt REAL,
            xamount REAL,
            xbonuspoints REAL,
            xcardamt REAL,
            xcardno TEXT,
            xcardtype TEXT,
            xcashamt REAL,
            xchange REAL,
            xcus TEXT,
            xdate TEXT,
            xdisc REAL,
            xdiscamt REAL,
            xdiscf REAL,
            xdiv TEXT,
            xexpamt REAL,
            xfield TEXT,
            xnetamt REAL,
            xnote TEXT,
            xnote1 TEXT,
            xpaid REAL,
            xpaymentterm TEXT,
            xpaymenttype TEXT,
            xpaytype TEXT,
            xperson TEXT,
            xref TEXT,
            xroundingchange REAL,
            xshift TEXT,
            xshopno TEXT,
            xstatusprint TEXT,
            xsupptaxamt REAL,
            xterminal TEXT,
            xtotamt REAL,
            xvatamt REAL,
            xworkingdate TEXT,
            zauserid TEXT,
            zid int NOT NULL,
            ztime TEXT,
            zutime TEXT,
            zuuserid TEXT
          )
          """);




        },
        onUpgrade: (Database db, int oldversion,int newversion)async{
          if (oldversion<newversion) {
            print("Version Upgrade");
          }
        }
    );
    print('db initialize');
    return openDb;
  }


  insertItem(ItemInfoModel newItem) async {
    await delete_All_Item();
    final db = await _db;
    final res = await db!.insert('$productTable', newItem.toJson());
    print(res);
    return res;
  }



  Future<int> delete_All_Item() async {
    final db = await _db;
    final res = await db!.rawDelete('DELETE FROM $productTable');
    return res;
  }

}



// CREATE TABLE $productTable (
//   id INTEGER PRIMARY KEY AUTOINCREMENT,
//   xitem TEXT NOT NULL,
//   hscode TEXT,
//   xalias TEXT,
//   xautogrn TEXT,
//   xbimage TEXT,
//   xbin TEXT,
//   xbnprintstatus TEXT,
//   xbodycode TEXT,
//   xbrand TEXT,
//   xcartoon INTEGER,
//   xcatitem TEXT,
//   xcfiss INTEGER,
//   xcfpck INTEGER,
//   xcfpur INTEGER,
//   xcfsel INTEGER,
//   xcitem TEXT,
//   xcodeold TEXT,
//   xcost INTEGER,
//   xcountry TEXT,
//   xcus TEXT,
//   xdatecreate TEXT,
//   xdateeff TEXT,
//   xdateexp TEXT,
//   xdealerp INTEGER,
//   xdesc TEXT,
//   xdisc INTEGER,
//   xdiscstatus TEXT,
//   xdisctype TEXT,
//   xdornum TEXT,
//   xendtime TEXT,
//   xgitem TEXT,
//   xgrade TEXT,
//   xgritem TEXT,
//   xhscode TEXT,
//   xitemdept TEXT,
//   xitemsubdept TEXT,
//   xlmax INTEGER,
//   xlmin INTEGER,
//   xlong TEXT,
//   xminqty INTEGER,
//   xmodel TEXT,
//   xmrp INTEGER,
//   xpacking TEXT,
//   xpackqty INTEGER,
//   xpackweightnet INTEGER,
//   xpartno TEXT,
//   xpnature TEXT,
//   xpsize TEXT,
//   xrate INTEGER,
//   xrateexp INTEGER,
//   xreordlvl INTEGER,
//   xsdcat TEXT,
//   xserialnum TEXT,
//   xserialtype TEXT,
//   xsetmenustatus TEXT,
//   xshelf TEXT,
//   xshopno TEXT,
//   xspecification TEXT,
//   xstarttime TEXT,
//   xstype TEXT,
//   xsubcat TEXT,
//   xsupptaxamt INTEGER,
//   xsupptaxrate INTEGER,
//   xtaxrate INTEGER,
//   xtheircode TEXT,
//   xtitem TEXT,
//   xtype TEXT,
//   xtypeitem TEXT,
//   xunit TEXT,
//   xunitiss TEXT,
//   xunitpck TEXT,
//   xunitpur TEXT,
//   xunitsel TEXT,
//   xvatamt INTEGER,
//   xvatcat TEXT,
//   xvatrate INTEGER,
//   xwper TEXT,
//   zactive TEXT,
//   zauserid TEXT,
//   zid INTEGER,
//   ztime TEXT,
//   zutime TEXT,
//   zuuserid TEXT
//   )