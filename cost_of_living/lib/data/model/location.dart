import 'dart:ffi';

class Location {
  final int cityId;
  final String cityName;
  final String countryName;
  final Long latitude;
  final Long longitude;
  final String? stateCode;

  const Location({
    required this.cityId,
    required this.cityName,
    required this.countryName,
    required this.latitude,
    required this.longitude,
    this.stateCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          runtimeType == other.runtimeType &&
          cityId == other.cityId &&
          cityName == other.cityName &&
          countryName == other.countryName &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          stateCode == other.stateCode);

  @override
  int get hashCode =>
      cityId.hashCode ^
      cityName.hashCode ^
      countryName.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      stateCode.hashCode;

  @override
  String toString() =>
      'City{ cityId: $cityId, cityName: $cityName, countryName: $countryName, latitude: $latitude, longitude: $longitude, stateCode: $stateCode,}';

  Location copyWith({
    int? cityId,
    String? cityName,
    String? countryName,
    Long? latitude,
    Long? longitude,
    String? stateCode,
  }) {
    return Location(
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      countryName: countryName ?? this.countryName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      stateCode: stateCode ?? this.stateCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cityId': this.cityId,
      'cityName': this.cityName,
      'countryName': this.countryName,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'stateCode': this.stateCode,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      cityId: map['cityId'] as int,
      cityName: map['cityName'] as String,
      countryName: map['countryName'] as String,
      latitude: map['latitude'] as Long,
      longitude: map['longitude'] as Long,
      stateCode: map['stateCode'] as String,
    );
  }
}
