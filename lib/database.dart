import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String mongoUri = dotenv.env['MONGO_URI'].toString();

class MongoDatabase {
  static Db? db;
  static final DbCollection employee = db!.collection("employee");

  static Future<void> connect() async {
    try {
      db = await Db.create(mongoUri);
      await db!.open();
      inspect(db);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> close() async {
    try {
      await db!.close();
    } catch (e) {
      log(e.toString());
    }
  }
}
