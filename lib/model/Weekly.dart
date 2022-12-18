class Weekly {
  double? _latitude;
  double? _longitude;
  double? _generationtimeMs;
  int? _utcOffsetSeconds;
  String? _timezone;
  String? _timezoneAbbreviation;
  int? _elevation;
  DailyUnits? _dailyUnits;
  Daily? _daily;

  Weekly(
      {double? latitude,
        double? longitude,
        double? generationtimeMs,
        int? utcOffsetSeconds,
        String? timezone,
        String? timezoneAbbreviation,
        int? elevation,
        DailyUnits? dailyUnits,
        Daily? daily}) {
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (generationtimeMs != null) {
      this._generationtimeMs = generationtimeMs;
    }
    if (utcOffsetSeconds != null) {
      this._utcOffsetSeconds = utcOffsetSeconds;
    }
    if (timezone != null) {
      this._timezone = timezone;
    }
    if (timezoneAbbreviation != null) {
      this._timezoneAbbreviation = timezoneAbbreviation;
    }
    if (elevation != null) {
      this._elevation = elevation;
    }
    if (dailyUnits != null) {
      this._dailyUnits = dailyUnits;
    }
    if (daily != null) {
      this._daily = daily;
    }
  }

  double? get latitude => _latitude;
  set latitude(double? latitude) => _latitude = latitude;
  double? get longitude => _longitude;
  set longitude(double? longitude) => _longitude = longitude;
  double? get generationtimeMs => _generationtimeMs;
  set generationtimeMs(double? generationtimeMs) =>
      _generationtimeMs = generationtimeMs;
  int? get utcOffsetSeconds => _utcOffsetSeconds;
  set utcOffsetSeconds(int? utcOffsetSeconds) =>
      _utcOffsetSeconds = utcOffsetSeconds;
  String? get timezone => _timezone;
  set timezone(String? timezone) => _timezone = timezone;
  String? get timezoneAbbreviation => _timezoneAbbreviation;
  set timezoneAbbreviation(String? timezoneAbbreviation) =>
      _timezoneAbbreviation = timezoneAbbreviation;
  int? get elevation => _elevation;
  set elevation(int? elevation) => _elevation = elevation;
  DailyUnits? get dailyUnits => _dailyUnits;
  set dailyUnits(DailyUnits? dailyUnits) => _dailyUnits = dailyUnits;
  Daily? get daily => _daily;
  set daily(Daily? daily) => _daily = daily;

  Weekly.fromJson(Map<String, dynamic> json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _generationtimeMs = json['generationtime_ms'];
    _utcOffsetSeconds = json['utc_offset_seconds'];
    _timezone = json['timezone'];
    _timezoneAbbreviation = json['timezone_abbreviation'];
    _elevation = json['elevation'];
    _dailyUnits = json['daily_units'] != null
        ? new DailyUnits.fromJson(json['daily_units'])
        : null;
    _daily = json['daily'] != null ? new Daily.fromJson(json['daily']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    data['generationtime_ms'] = this._generationtimeMs;
    data['utc_offset_seconds'] = this._utcOffsetSeconds;
    data['timezone'] = this._timezone;
    data['timezone_abbreviation'] = this._timezoneAbbreviation;
    data['elevation'] = this._elevation;
    if (this._dailyUnits != null) {
      data['daily_units'] = this._dailyUnits!.toJson();
    }
    if (this._daily != null) {
      data['daily'] = this._daily!.toJson();
    }
    return data;
  }
}

class DailyUnits {
  String? _time;
  String? _temperature2mMax;

  DailyUnits({String? time, String? temperature2mMax}) {
    if (time != null) {
      this._time = time;
    }
    if (temperature2mMax != null) {
      this._temperature2mMax = temperature2mMax;
    }
  }

  String? get time => _time;
  set time(String? time) => _time = time;
  String? get temperature2mMax => _temperature2mMax;
  set temperature2mMax(String? temperature2mMax) =>
      _temperature2mMax = temperature2mMax;

  DailyUnits.fromJson(Map<String, dynamic> json) {
    _time = json['time'];
    _temperature2mMax = json['temperature_2m_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this._time;
    data['temperature_2m_max'] = this._temperature2mMax;
    return data;
  }
}

class Daily {
  List<String>? _time;
  List<double>? _temperature2mMax;

  Daily({List<String>? time, List<double>? temperature2mMax}) {
    if (time != null) {
      this._time = time;
    }
    if (temperature2mMax != null) {
      this._temperature2mMax = temperature2mMax;
    }
  }

  List<String>? get time => _time;
  set time(List<String>? time) => _time = time;
  List<double>? get temperature2mMax => _temperature2mMax;
  set temperature2mMax(List<double>? temperature2mMax) =>
      _temperature2mMax = temperature2mMax;

  Daily.fromJson(Map<String, dynamic> json) {
    _time = json['time'].cast<String>();
    _temperature2mMax = json['temperature_2m_max'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this._time;
    data['temperature_2m_max'] = this._temperature2mMax;
    return data;
  }
}