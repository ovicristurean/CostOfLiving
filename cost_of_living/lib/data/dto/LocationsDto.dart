import '../model/location.dart';

class LocationsDto {
  final List<Location> locations;
  final String? error;

  const LocationsDto({
    required this.locations,
    this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationsDto &&
          runtimeType == other.runtimeType &&
          locations == other.locations &&
          error == other.error);

  @override
  int get hashCode => locations.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'LocationsDto{' +
        ' locations: $locations,' +
        ' error: $error,' +
        '}';
  }

  LocationsDto copyWith({
    List<Location>? locations,
    String? error,
  }) {
    return LocationsDto(
      locations: locations ?? this.locations,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'locations': this.locations,
      'error': this.error,
    };
  }

  factory LocationsDto.fromMap(Map<String, dynamic> map) {
    return LocationsDto(
      locations: (map['cities'] as List<dynamic>)
          .map((e) => Location.fromMap(e as Map<String, dynamic>))
          .toList(),
      error: map['error'] as String?,
    );
  }
}
