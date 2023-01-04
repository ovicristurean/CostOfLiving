import 'package:cost_of_living/data/model/location.dart';
import 'package:cost_of_living/domain/model/location_model.dart';

List<LocationModel> toModelList(List<Location> locations) =>
    locations.map((e) => toModel(e)).toList();

LocationModel toModel(Location city) {
  return LocationModel(
    cityId: city.cityId,
    cityName: city.cityName,
    countryName: city.countryName,
  );
}
