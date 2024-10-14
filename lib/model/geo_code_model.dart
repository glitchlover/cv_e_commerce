// To parse this JSON data, do
//
//     final geoCodeModel = geoCodeModelFromJson(jsonString);

import 'dart:convert';

GeoCodeModel geoCodeModelFromJson(String str) => GeoCodeModel.fromJson(json.decode(str));

String geoCodeModelToJson(GeoCodeModel data) => json.encode(data.toJson());

class GeoCodeModel {
    String? type;
    List<Feature>? features;
    Query? query;

    GeoCodeModel({
        this.type,
        this.features,
        this.query,
    });

    factory GeoCodeModel.fromJson(Map<String, dynamic> json) => GeoCodeModel(
        type: json["type"],
        features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x.toJson())),
        "query": query?.toJson(),
    };
}

class Feature {
    String? type;
    Properties? properties;
    Geometry? geometry;
    List<double>? bbox;

    Feature({
        this.type,
        this.properties,
        this.geometry,
        this.bbox,
    });

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: json["type"],
        properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        bbox: json["bbox"] == null ? [] : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties?.toJson(),
        "geometry": geometry?.toJson(),
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
    };
}

class Geometry {
    String? type;
    List<double>? coordinates;

    Geometry({
        this.type,
        this.coordinates,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    };
}

class Properties {
    Datasource? datasource;
    String? name;
    String? country;
    String? countryCode;
    String? state;
    String? county;
    String? city;
    String? postcode;
    String? suburb;
    String? street;
    double? lon;
    double? lat;
    String? resultType;
    double? distance;
    String? formatted;
    String? addressLine1;
    String? addressLine2;
    Timezone? timezone;
    String? plusCode;
    Rank? rank;
    String? placeId;

    Properties({
        this.datasource,
        this.name,
        this.country,
        this.countryCode,
        this.state,
        this.county,
        this.city,
        this.postcode,
        this.suburb,
        this.street,
        this.lon,
        this.lat,
        this.resultType,
        this.distance,
        this.formatted,
        this.addressLine1,
        this.addressLine2,
        this.timezone,
        this.plusCode,
        this.rank,
        this.placeId,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        datasource: json["datasource"] == null ? null : Datasource.fromJson(json["datasource"]),
        name: json["name"],
        country: json["country"],
        countryCode: json["country_code"],
        state: json["state"],
        county: json["county"],
        city: json["city"],
        postcode: json["postcode"],
        suburb: json["suburb"],
        street: json["street"],
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        resultType: json["result_type"],
        distance: json["distance"]?.toDouble(),
        formatted: json["formatted"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        timezone: json["timezone"] == null ? null : Timezone.fromJson(json["timezone"]),
        plusCode: json["plus_code"],
        rank: json["rank"] == null ? null : Rank.fromJson(json["rank"]),
        placeId: json["place_id"],
    );

    Map<String, dynamic> toJson() => {
        "datasource": datasource?.toJson(),
        "name": name,
        "country": country,
        "country_code": countryCode,
        "state": state,
        "county": county,
        "city": city,
        "postcode": postcode,
        "suburb": suburb,
        "street": street,
        "lon": lon,
        "lat": lat,
        "result_type": resultType,
        "distance": distance,
        "formatted": formatted,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "timezone": timezone?.toJson(),
        "plus_code": plusCode,
        "rank": rank?.toJson(),
        "place_id": placeId,
    };
}

class Datasource {
    String? sourcename;
    String? attribution;
    String? license;
    String? url;

    Datasource({
        this.sourcename,
        this.attribution,
        this.license,
        this.url,
    });

    factory Datasource.fromJson(Map<String, dynamic> json) => Datasource(
        sourcename: json["sourcename"],
        attribution: json["attribution"],
        license: json["license"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "sourcename": sourcename,
        "attribution": attribution,
        "license": license,
        "url": url,
    };
}

class Rank {
    double? importance;

    Rank({
        this.importance,
    });

    factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        importance: json["importance"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "importance": importance,
    };
}

class Timezone {
    String? name;
    String? offsetStd;
    int? offsetStdSeconds;
    String? offsetDst;
    int? offsetDstSeconds;

    Timezone({
        this.name,
        this.offsetStd,
        this.offsetStdSeconds,
        this.offsetDst,
        this.offsetDstSeconds,
    });

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        name: json["name"],
        offsetStd: json["offset_STD"],
        offsetStdSeconds: json["offset_STD_seconds"],
        offsetDst: json["offset_DST"],
        offsetDstSeconds: json["offset_DST_seconds"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "offset_STD": offsetStd,
        "offset_STD_seconds": offsetStdSeconds,
        "offset_DST": offsetDst,
        "offset_DST_seconds": offsetDstSeconds,
    };
}

class Query {
    double? lat;
    double? lon;
    String? plusCode;

    Query({
        this.lat,
        this.lon,
        this.plusCode,
    });

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        plusCode: json["plus_code"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "plus_code": plusCode,
    };
}
