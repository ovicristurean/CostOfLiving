import 'package:cost_of_living/domain/model/location_model.dart';

import '../model/location.dart';

abstract class LocationsRepository {
  Future<List<LocationModel>> getLocations();
}
