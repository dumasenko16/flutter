// To parse this JSON data, do
//
//     final day = dayFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Day {
  Day({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.dailyUnits,
    required this.daily,
  });

  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final int elevation;
  final DailyUnits dailyUnits;
  final Daily daily;

  factory Day.fromRawJson(String str) => Day.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    generationtimeMs: json["generationtime_ms"].toDouble(),
    utcOffsetSeconds: json["utc_offset_seconds"],
    timezone: json["timezone"],
    timezoneAbbreviation: json["timezone_abbreviation"],
    elevation: json["elevation"],
    dailyUnits: DailyUnits.fromJson(json["daily_units"]),
    daily: Daily.fromJson(json["daily"]),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "generationtime_ms": generationtimeMs,
    "utc_offset_seconds": utcOffsetSeconds,
    "timezone": timezone,
    "timezone_abbreviation": timezoneAbbreviation,
    "elevation": elevation,
    "daily_units": dailyUnits.toJson(),
    "daily": daily.toJson(),
  };
}

class Daily {
  Daily({
    required this.time,
    required this.temperature2MMax,
  });

  final List<DateTime> time;
  final List<double> temperature2MMax;

  factory Daily.fromRawJson(String str) => Daily.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
    temperature2MMax: List<double>.from(json["temperature_2m_max"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "time": List<dynamic>.from(time.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
    "temperature_2m_max": List<dynamic>.from(temperature2MMax.map((x) => x)),
  };
}

class DailyUnits {
  DailyUnits({
    required this.time,
    required this.temperature2MMax,
  });

  final String time;
  final String temperature2MMax;

  factory DailyUnits.fromRawJson(String str) => DailyUnits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
    time: json["time"],
    temperature2MMax: json["temperature_2m_max"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "temperature_2m_max": temperature2MMax,
  };
}
