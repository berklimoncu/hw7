import 'dart:convert';
import 'package:hw7/entity/yapilacaklar.dart';
import 'package:hw7/sqlite/dbHelper.dart';

class TasksDaoRepository {
  
  Future<void> insertData(String yapilacak_is) async {
    final db = await DbHelper.dbAccess();
    var insertedData = Map<String, dynamic>();
    insertedData["yapilacak_is"] = yapilacak_is;

    await db.insert("yapilacaklar", insertedData);
  }

  Future<void> updateTask(int yapilacak_id,String yapilacak_is) async{
    final db = await DbHelper.dbAccess();
    var updatedData = Map<String, dynamic>();
    updatedData["yapilacak_is"] = yapilacak_is;

    await db.update("yapilacaklar", updatedData, where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }
 
  Future<List<Yapilacaklar>> getAllTasks() async {
    print("Yapilacaklar Getiriliyor...");

    var db = await DbHelper.dbAccess();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM yapilacaklar");
    

    return List.generate(maps.length, (index) {
      var row = maps[index];
      print(row);
      return Yapilacaklar(
        yapilacak_id: row["yapilacak_id"],
        yapilacak_is: row["yapilacak_is"],
      );
    });
  }

  Future<List<Yapilacaklar>> searchTask(String keyword) async{
    print("Yapilacaklar Aranıyor...");

    var db = await DbHelper.dbAccess();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM yapilacaklar where yapilacak_is like '%$keyword%'");
    

    return List.generate(maps.length, (index) {
      var row = maps[index];
      print(row);
      return Yapilacaklar(
        yapilacak_id: row["yapilacak_id"],
        yapilacak_is: row["yapilacak_is"],
      );
    });
  }

  Future<void> deleteTask(int yapilacak_id) async{
    print("Yapılacak Siliniyor...");

    var db = await DbHelper.dbAccess();
    await db.delete("yapilacaklar", where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }


}
