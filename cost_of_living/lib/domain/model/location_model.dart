class LocationModel {
  final int cityId;
  final String cityName;
  final String countryName;

  const LocationModel({
    required this.cityId,
    required this.cityName,
    required this.countryName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationModel &&
          runtimeType == other.runtimeType &&
          cityId == other.cityId &&
          cityName == other.cityName &&
          countryName == other.countryName);

  @override
  int get hashCode =>
      cityId.hashCode ^ cityName.hashCode ^ countryName.hashCode;

  @override
  String toString() =>
      'CityModel{ cityId: $cityId, cityName: $cityName, countryName: $countryName,}';

  LocationModel copyWith({
    int? cityId,
    String? cityName,
    String? countryName,
  }) {
    return LocationModel(
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      countryName: countryName ?? this.countryName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cityId': this.cityId,
      'cityName': this.cityName,
      'countryName': this.countryName,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      cityId: map['cityId'] as int,
      cityName: map['cityName'] as String,
      countryName: map['countryName'] as String,
    );
  }
}
