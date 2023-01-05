import 'package:cost_of_living/data/response/LocationsResponse.dart';

import '../model/location.dart';

abstract class LocationsRepository {
  Future<LocationsResponse> getLocations();
}
