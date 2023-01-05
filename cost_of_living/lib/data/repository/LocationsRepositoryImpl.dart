import 'dart:convert';

import 'package:cost_of_living/data/dto/LocationsDto.dart';
import 'package:cost_of_living/data/repository/LocationsRepository.dart';
import 'package:cost_of_living/data/response/LocationsResponse.dart';
import 'package:http/http.dart' as http;

class LocationsRepositoryImpl implements LocationsRepository {
  @override
  Future<LocationsResponse> getLocations() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-RapidAPI-Key': '31092a008cmshdaddd418d3d5412p1dc76ajsn7568e0258d28',
      'X-RapidAPI-Host': 'cost-of-living-and-prices.p.rapidapi.com'
    };

    var url = Uri.https("cost-of-living-and-prices.p.rapidapi.com", "/cities");
    var response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var json = response.body;
      var responseMap = jsonDecode(json);
      return LocationsSuccessResponse(LocationsDto.fromMap(responseMap));
    } else {
      return LocationsErrorResponse(response.statusCode, response.body);
    }
  }
}
