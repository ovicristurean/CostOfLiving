import 'package:cost_of_living/domain/model/location_model.dart';

class LocationViewData {
  final String cityName;
  final String countryName;

  const LocationViewData({
    required this.cityName,
    required this.countryName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationViewData &&
          runtimeType == other.runtimeType &&
          cityName == other.cityName &&
          countryName == other.countryName);

  @override
  int get hashCode => cityName.hashCode ^ countryName.hashCode;

  @override
  String toString() =>
      'CityViewData{ cityName: $cityName, countryName: $countryName,}';

  LocationViewData copyWith({
    String? cityName,
    String? countryName,
  }) {
    return LocationViewData(
      cityName: cityName ?? this.cityName,
      countryName: countryName ?? this.countryName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cityName': this.cityName,
      'countryName': this.countryName,
    };
  }

  factory LocationViewData.fromMap(Map<String, dynamic> map) {
    return LocationViewData(
      cityName: map['cityName'] as String,
      countryName: map['countryName'] as String,
    );
  }
}

List<LocationViewData> toViewDataList(List<LocationModel> locationModels) =>
    locationModels.map((e) => toViewData(e)).toList();

LocationViewData toViewData(LocationModel locationModel) => LocationViewData(
    cityName: locationModel.cityName, countryName: locationModel.countryName);
