import 'package:floor/floor.dart';

@entity
class WeeklyEntity {
  @primaryKey
  final int id;

  final String temperature;

  WeeklyEntity(this.id, this.temperature);
}