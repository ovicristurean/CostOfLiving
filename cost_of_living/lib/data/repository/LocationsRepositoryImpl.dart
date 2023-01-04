import 'dart:convert';

import 'package:cost_of_living/data/dto/LocationsDto.dart';
import 'package:cost_of_living/data/repository/LocationsRepository.dart';
import 'package:cost_of_living/domain/mapper/location_mapper.dart';
import 'package:cost_of_living/domain/model/location_model.dart';
import 'package:http/http.dart' as http;

import '../model/location.dart';

class LocationsRepositoryImpl implements LocationsRepository {
  @override
  Future<List<LocationModel>> getLocations() async {
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
      return toModelList(LocationsDto.fromMap(responseMap).locations);
    }
    throw UnimplementedError();
  }
}
