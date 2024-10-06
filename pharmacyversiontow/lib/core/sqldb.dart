import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String pathdatabase = await getDatabasesPath();
    String path = join(pathdatabase, 'pharma.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 4, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    print("noUpgrade=================================================");

    //await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    batch.execute('''
  CREATE TABLE "Accounts" (
	"AccNom"	INTEGER NOT NULL,
	"Amount"	REAL NOT NULL,
	"acoountlimit"	REAL,
	PRIMARY KEY("AccNom")
);

  ''');

    batch.execute('''
 CREATE TABLE "Customer" (
	"customerId"	INTEGER NOT NULL,
	"fkaccNom"	INTEGER,
	"customerName"	TEXT NOT NULL,
	"phoneNum"	INTEGER,
	FOREIGN KEY("fkaccNom") REFERENCES "Accounts"("AccNom"),
	PRIMARY KEY("customerId" )
);
  
  ''');

    batch.execute('''
 CREATE TABLE "countries" (
	"countryId"	INTEGER NOT NULL,
	"countryName"	TEXT NOT NULL,
	PRIMARY KEY("countryId" )
);
  
  ''');

    batch.execute('''
 CREATE TABLE "suppliers" (
	"supID"	INTEGER NOT NULL,
	"fksuaccNom"	INTEGER,
	"supName"	TEXT NOT NULL UNIQUE,
	"supCompany"	TEXT NOT NULL,
	"supPhone"	INTEGER,
	FOREIGN KEY("fksuaccNom") REFERENCES "Accounts"("AccNom"),
	PRIMARY KEY("supID" )
);
  
  ''');

    batch.execute('''
  CREATE TABLE "medicine" (
	"medicineID"	INTEGER NOT NULL,
	"medicineName"	TEXT NOT NULL,
	"GroubNumber"	INTEGER NOT NULL,
	"Quantity"	INTEGER NOT NULL,
	"price"	NUMERIC NOT NULL,
	"dateOFProduction"	TEXT NOT NULL,
  "dateOFBuy"	TEXT NOT NULL,
	"supplierID"	INTEGER NOT NULL,
  "userId"	INTEGER NOT NULL,
	"expriyDate"	TEXT NOT NULL,
	"parCodeNum"	INTEGER,
	"countryMade"	INTEGER,
  "companyName"	TEXT,
	PRIMARY KEY("medicineID"),
  FOREIGN KEY("userId") REFERENCES "users"("uId"),
	FOREIGN KEY("countryMade") REFERENCES "countries"("countryId"),
	FOREIGN KEY("supplierID") REFERENCES "suppliers"("supID")
);
  
  ''');

    batch.execute('''
 CREATE TABLE "medicinLocation" (
	"posID"	INTEGER NOT NULL,
	"fkmedicineID"	INTEGER NOT NULL,
	"column"	INTEGER,
	"row"	INTEGER,
	PRIMARY KEY("posID" ),
	FOREIGN KEY("fkmedicineID") REFERENCES "medicine"("medicineID")
);
  
  ''');

    batch.execute('''
CREATE TABLE "purchase" (
	"ID"	INTEGER,
  "Quantity"	INTEGER NOT NULL,
	"price"	NUMERIC NOT NULL,
	"supplierId"	INTEGER,
	"medicineID"	INTEGER NOT NULL,
	PRIMARY KEY("ID" ),
	FOREIGN KEY("supplierId") REFERENCES "suppliers"("supID"),
	FOREIGN KEY("medicineID") REFERENCES "medicine"("medicineID")
);

  
  ''');

    batch.execute('''
 CREATE TABLE "sales" (
	"id"	INTEGER NOT NULL,
	"fkcustomerId"	INTEGER ,
	"fkmedicineID"	INTEGER NOT NULL,
	"quantaty"	INTEGER,
	"UnitePrice"	INTEGER,
	"totalPrice"	INTEGER,
	"date"	TEXT,
	FOREIGN KEY("fkmedicineID") REFERENCES "medicine"("medicineID"),
	FOREIGN KEY("fkcustomerId") REFERENCES "Customer"("customerId"),
	PRIMARY KEY("id")
);
  
  ''');

    batch.execute('''
 CREATE TABLE "users" (
	"uId"	INTEGER NOT NULL,
	"uName"	TEXT NOT NULL,
	"uPass"	TEXT NOT NULL,
	PRIMARY KEY("uId")
);
  
  ''');

    batch.execute('''
 CREATE TABLE "operation" (
	"opId"	INTEGER NOT NULL,
	"uId"	INTEGER,
	"AccNom"	INTEGER,
	"salesId"	INTEGER,
	"opType"	INTEGER NOT NULL,
	"amount"	REAL NOT NULL,
	PRIMARY KEY("opId" AUTOINCREMENT),
	FOREIGN KEY("salesId") REFERENCES "sales"("id"),
	FOREIGN KEY("AccNom") REFERENCES "Accounts"("AccNom"),
	FOREIGN KEY("uId") REFERENCES "users"("uId")
);
  
  ''');

    await batch.commit();

    print("_onCreate======================================================");
  }

//SELECT
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

//INSERT
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    print("inserted============================================");
    return response;
  }

//UPDATE
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

//DELETE
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  deleteDataBase() async {
    String pathdatabase = await getDatabasesPath();
    String path = join(pathdatabase, 'pharma.db');
    deleteDatabase(path);
    print("delet database===========================");
  }
}
