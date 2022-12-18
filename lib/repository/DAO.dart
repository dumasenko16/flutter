import 'package:floor/floor.dart';

import '../model/Weekly.dart';

@dao
abstract class WeeklyDao {
 @Query ('SELECT * FROM Weekly WHERE id = :id')
  Stream<Weekly?> findWeeklyById(int id);
 @insert
 Future<void> insertWeekly(Weekly weekly);
}
