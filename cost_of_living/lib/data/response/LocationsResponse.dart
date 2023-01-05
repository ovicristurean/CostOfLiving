import '../dto/LocationsDto.dart';

abstract class LocationsResponse {}

class LocationsSuccessResponse extends LocationsResponse {
  final LocationsDto locationsDto;

  LocationsSuccessResponse(this.locationsDto);
}

class LocationsErrorResponse extends LocationsResponse {
  final int statusCode;
  final String message;

  LocationsErrorResponse(this.statusCode, this.message);
}
