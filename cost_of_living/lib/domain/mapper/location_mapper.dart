import 'package:cost_of_living/data/model/location.dart';
import 'package:cost_of_living/domain/model/location_model.dart';

LocationModel toModel(Location city) {
  return LocationModel(
    cityId: city.cityId,
    cityName: city.cityName,
    countryName: city.countryName,
  );
}
