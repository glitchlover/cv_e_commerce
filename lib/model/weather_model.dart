// To parse this JSON data, do
//
//     final currentWeatherEntity = currentWeatherEntityFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherEntityFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherEntityToJson(WeatherModel data) =>
    json.encode(data.toJson());

class WeatherModel {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  dynamic utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  dynamic elevation;
  CurrentUnits? currentUnits;
  Current? current;
  DailyUnits? dailyUnits;
  Daily? daily;

  WeatherModel({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
    this.dailyUnits,
    this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentUnits: json["current_units"] == null
            ? null
            : CurrentUnits.fromJson(json["current_units"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        dailyUnits: json["daily_units"] == null
            ? null
            : DailyUnits.fromJson(json["daily_units"]),
        daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_units": currentUnits?.toJson(),
        "current": current?.toJson(),
        "daily_units": dailyUnits?.toJson(),
        "daily": daily?.toJson(),
      };
}

class Current {
  String? time;
  dynamic interval;
  double? temperature2M;
  dynamic relativeHumidity2M;
  dynamic apparentTemperature;
  dynamic isDay;
  dynamic precipitation;
  dynamic weatherCode;
  double? windSpeed10M;
  dynamic windDirection10M;

  Current({
    this.time,
    this.interval,
    this.temperature2M,
    this.relativeHumidity2M,
    this.apparentTemperature,
    this.isDay,
    this.precipitation,
    this.weatherCode,
    this.windSpeed10M,
    this.windDirection10M,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"]?.toDouble(),
        relativeHumidity2M: json["relative_humidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        isDay: json["is_day"],
        precipitation: json["precipitation"],
        weatherCode: json["weather_code"],
        windSpeed10M: json["wind_speed_10m"]?.toDouble(),
        windDirection10M: json["wind_direction_10m"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "is_day": isDay,
        "precipitation": precipitation,
        "weather_code": weatherCode,
        "wind_speed_10m": windSpeed10M,
        "wind_direction_10m": windDirection10M,
      };
}

class CurrentUnits {
  String? time;
  String? interval;
  String? temperature2M;
  String? relativeHumidity2M;
  String? apparentTemperature;
  String? isDay;
  String? precipitation;
  String? weatherCode;
  String? windSpeed10M;
  String? windDirection10M;

  CurrentUnits({
    this.time,
    this.interval,
    this.temperature2M,
    this.relativeHumidity2M,
    this.apparentTemperature,
    this.isDay,
    this.precipitation,
    this.weatherCode,
    this.windSpeed10M,
    this.windDirection10M,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"],
        relativeHumidity2M: json["relative_humidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        isDay: json["is_day"],
        precipitation: json["precipitation"],
        weatherCode: json["weather_code"],
        windSpeed10M: json["wind_speed_10m"],
        windDirection10M: json["wind_direction_10m"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "is_day": isDay,
        "precipitation": precipitation,
        "weather_code": weatherCode,
        "wind_speed_10m": windSpeed10M,
        "wind_direction_10m": windDirection10M,
      };
}

class Daily {
  List<DateTime>? time;
  List<int>? weatherCode;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double>? daylightDuration;
  List<double>? uvIndexMax;
  List<int>? precipitationProbabilityMax;

  Daily({
    this.time,
    this.weatherCode,
    this.temperature2MMax,
    this.temperature2MMin,
    this.sunrise,
    this.sunset,
    this.daylightDuration,
    this.uvIndexMax,
    this.precipitationProbabilityMax,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: json["time"] == null
            ? []
            : List<DateTime>.from(json["time"]!.map((x) => DateTime.parse(x))),
        weatherCode: json["weather_code"] == null
            ? []
            : List<int>.from(json["weather_code"]!.map((x) => x)),
        temperature2MMax: json["temperature_2m_max"] == null
            ? []
            : List<double>.from(
                json["temperature_2m_max"]!.map((x) => x?.toDouble())),
        temperature2MMin: json["temperature_2m_min"] == null
            ? []
            : List<double>.from(
                json["temperature_2m_min"]!.map((x) => x?.toDouble())),
        sunrise: json["sunrise"] == null
            ? []
            : List<String>.from(json["sunrise"]!.map((x) => x)),
        sunset: json["sunset"] == null
            ? []
            : List<String>.from(json["sunset"]!.map((x) => x)),
        daylightDuration: json["daylight_duration"] == null
            ? []
            : List<double>.from(
                json["daylight_duration"]!.map((x) => x?.toDouble())),
        uvIndexMax: json["uv_index_max"] == null
            ? []
            : List<double>.from(
                json["uv_index_max"]!.map((x) => x?.toDouble())),
        precipitationProbabilityMax:
            json["precipitation_probability_max"] == null
                ? []
                : List<int>.from(
                    json["precipitation_probability_max"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": time == null
            ? []
            : List<dynamic>.from(time!.map((x) =>
                "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "weather_code": weatherCode == null
            ? []
            : List<dynamic>.from(weatherCode!.map((x) => x)),
        "temperature_2m_max": temperature2MMax == null
            ? []
            : List<dynamic>.from(temperature2MMax!.map((x) => x)),
        "temperature_2m_min": temperature2MMin == null
            ? []
            : List<dynamic>.from(temperature2MMin!.map((x) => x)),
        "sunrise":
            sunrise == null ? [] : List<dynamic>.from(sunrise!.map((x) => x)),
        "sunset":
            sunset == null ? [] : List<dynamic>.from(sunset!.map((x) => x)),
        "daylight_duration": daylightDuration == null
            ? []
            : List<dynamic>.from(daylightDuration!.map((x) => x)),
        "uv_index_max": uvIndexMax == null
            ? []
            : List<dynamic>.from(uvIndexMax!.map((x) => x)),
        "precipitation_probability_max": precipitationProbabilityMax == null
            ? []
            : List<dynamic>.from(precipitationProbabilityMax!.map((x) => x)),
      };
}

class DailyUnits {
  String? time;
  String? weatherCode;
  String? temperature2MMax;
  String? temperature2MMin;
  String? sunrise;
  String? sunset;
  String? daylightDuration;
  String? uvIndexMax;
  String? precipitationProbabilityMax;

  DailyUnits({
    this.time,
    this.weatherCode,
    this.temperature2MMax,
    this.temperature2MMin,
    this.sunrise,
    this.sunset,
    this.daylightDuration,
    this.uvIndexMax,
    this.precipitationProbabilityMax,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        weatherCode: json["weather_code"],
        temperature2MMax: json["temperature_2m_max"],
        temperature2MMin: json["temperature_2m_min"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        daylightDuration: json["daylight_duration"],
        uvIndexMax: json["uv_index_max"],
        precipitationProbabilityMax: json["precipitation_probability_max"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "weather_code": weatherCode,
        "temperature_2m_max": temperature2MMax,
        "temperature_2m_min": temperature2MMin,
        "sunrise": sunrise,
        "sunset": sunset,
        "daylight_duration": daylightDuration,
        "uv_index_max": uvIndexMax,
        "precipitation_probability_max": precipitationProbabilityMax,
      };
}
