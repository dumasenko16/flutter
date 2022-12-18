


 import 'dart:async';
 import 'package:floor/floor.dart';
 import 'package:sqflite/sqflite.dart' as sqflite;



import 'package:weather_app_flutter/repository/DAO.dart';
 import 'Weekly.dart';

 part 'app_database.g.dart';

 @Database(version: 1, entities: [Weekly])
 abstract class AppDatabase extends FloorDatabase {
   WeeklyEntity get weeklyDao;
}

