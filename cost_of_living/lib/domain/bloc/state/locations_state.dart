import 'package:cost_of_living/presentation/model/location_view_data.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LocationsState {}

class LocationsLoading extends LocationsState {}

class LocationsFetched extends LocationsState {
  final List<LocationViewData> locations;

  LocationsFetched({required this.locations});
}

class LocationsError extends LocationsState {
  final String error;

  LocationsError(this.error);
}
