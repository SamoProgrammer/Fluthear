// To parse this JSON data, do
//
//     final currentWeatherModel = currentWeatherModelFromJson(jsonString);

import 'dart:convert';

CurrentWeatherModel currentWeatherModelFromJson(String str) => CurrentWeatherModel.fromJson(json.decode(str));

String currentWeatherModelToJson(CurrentWeatherModel data) => json.encode(data.toJson());

class CurrentWeatherModel {
    CurrentWeatherModel({
        required this.count,
        required this.data,
    });

    var count;
    List<Datum> data;

    factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => CurrentWeatherModel(
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.cityName,
        required this.stateCode,
        required this.countryCode,
        required this.timezone,
        required this.lat,
        required this.lon,
        required this.station,
        required this.sources,
        required this.vis,
        required this.rh,
        required this.dewpt,
        required this.windDir,
        required this.windCdir,
        required this.windCdirFull,
        required this.windSpeed,
        required this.temp,
        required this.appTemp,
        required this.clouds,
        required this.weather,
        required this.datetime,
        required this.obTime,
        required this.ts,
        required this.sunrise,
        required this.sunset,
        required this.slp,
        required this.pres,
        required this.aqi,
        required this.uv,
        required this.solarRad,
        required this.ghi,
        required this.dni,
        required this.dhi,
        required this.elevAngle,
        required this.hourAngle,
        required this.pod,
        required this.precip,
        required this.snow,
    });

    var cityName;
    var stateCode;
    var countryCode;
    var timezone;
    var lat;
    var lon;
    var station;
    List<String> sources;
    var vis;
    var rh;
    var dewpt;
    var windDir;
    var windCdir;
    var windCdirFull;
    var windSpeed;
    var temp;
    var appTemp;
    var clouds;
    Weather weather;
    var datetime;
    var obTime;
    var ts;
    var sunrise;
    var sunset;
    var slp;
    var pres;
    var aqi;
    var uv;
    var solarRad;
    var ghi;
    var dni;
    var dhi;
    var elevAngle;
    var hourAngle;
    var pod;
    var precip;
    var snow;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cityName: json["city_name"],
        stateCode: json["state_code"],
        countryCode: json["country_code"],
        timezone: json["timezone"],
        lat: json["lat"],
        lon: json["lon"],
        station: json["station"],
        sources: List<String>.from(json["sources"].map((x) => x)),
        vis: json["vis"],
        rh: json["rh"],
        dewpt: json["dewpt"],
        windDir: json["wind_dir"],
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
        windSpeed: json["wind_spd"],
        temp: json["temp"],
        appTemp: json["app_temp"],
        clouds: json["clouds"],
        weather: Weather.fromJson(json["weather"]),
        datetime: json["datetime"],
        obTime: json["ob_time"],
        ts: json["ts"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        slp: json["slp"],
        pres: json["pres"],
        aqi: json["aqi"],
        uv: json["uv"],
        solarRad: json["solar_rad"],
        ghi: json["ghi"],
        dni: json["dni"],
        dhi: json["dhi"],
        elevAngle: json["elev_angle"],
        hourAngle: json["hour_angle"],
        pod: json["pod"],
        precip: json["precip"],
        snow: json["snow"],
    );

    Map<String, dynamic> toJson() => {
        "city_name": cityName,
        "state_code": stateCode,
        "country_code": countryCode,
        "timezone": timezone,
        "lat": lat,
        "lon": lon,
        "station": station,
        "sources": List<dynamic>.from(sources.map((x) => x)),
        "vis": vis,
        "rh": rh,
        "dewpt": dewpt,
        "wind_dir": windDir,
        "wind_cdir": windCdir,
        "wind_cdir_full": windCdirFull,
        "wind_speed": windSpeed,
        "temp": temp,
        "app_temp": appTemp,
        "clouds": clouds,
        "weather": weather.toJson(),
        "datetime": datetime,
        "ob_time": obTime,
        "ts": ts,
        "sunrise": sunrise,
        "sunset": sunset,
        "slp": slp,
        "pres": pres,
        "aqi": aqi,
        "uv": uv,
        "solar_rad": solarRad,
        "ghi": ghi,
        "dni": dni,
        "dhi": dhi,
        "elev_angle": elevAngle,
        "hour_angle": hourAngle,
        "pod": pod,
        "precip": precip,
        "snow": snow,
    };
}

class Weather {
    Weather({
        required this.icon,
        required this.code,
        required this.description,
    });

    var icon;
    var code;
    var description;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        icon: json["icon"],
        code: json["code"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "icon": icon,
        "code": code,
        "description": description,
    };
}
