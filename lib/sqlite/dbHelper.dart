import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final String dbName = "yapilacaklar.sqlite";

  static Future<Database> dbAccess() async {
    String dbPath = join(await getDatabasesPath(), dbName);

    if(await databaseExists(dbPath)){
      print("Veritabanı mevcut");
    }
    else{
      ByteData data = await rootBundle.load("veritabani/$dbName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes,flush:true);
      print("Veritabanı oluşturuldu");
    }

    return openDatabase(dbPath);
  }
}
 