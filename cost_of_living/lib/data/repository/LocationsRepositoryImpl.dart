import 'dart:convert';
import 'dart:io';

import 'package:cost_of_living/data/dto/LocationsDto.dart';
import 'package:cost_of_living/data/repository/LocationsRepository.dart';
import 'package:cost_of_living/data/response/LocationsResponse.dart';

class LocationsRepositoryImpl implements LocationsRepository {
  @override
  Future<LocationsResponse> getLocations() async {
    HttpClient httpClient = HttpClient();
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-RapidAPI-Key': '31092a008cmshdaddd418d3d5412p1dc76ajsn7568e0258d28',
      'X-RapidAPI-Host': 'cost-of-living-and-prices.p.rapidapi.com'
    };

    //var url = Uri.https("cost-of-living-and-prices.p.rapidapi.com", "/cities");
    HttpClientRequest request = await httpClient.getUrl(
        Uri.https("cost-of-living-and-prices.p.rapidapi.com", "/cities"));
    request.headers.set('Content-type', 'application/json');
    request.headers.set('Accept', 'application/json');
    request.headers.set(
        'X-RapidAPI-Key', '31092a008cmshdaddd418d3d5412p1dc76ajsn7568e0258d28');
    request.headers
        .set('X-RapidAPI-Host', 'cost-of-living-and-prices.p.rapidapi.com');

    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      var json = await response.transform(utf8.decoder).join();
      var responseMap = jsonDecode(json);
      return LocationsSuccessResponse(LocationsDto.fromMap(responseMap));
    } else {
      return LocationsErrorResponse(response.statusCode, response.reasonPhrase);
    }
  }
}
