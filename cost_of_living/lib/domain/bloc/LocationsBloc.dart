import 'package:cost_of_living/domain/bloc/state/locations_state.dart';
import 'package:cost_of_living/domain/model/location_model.dart';
import 'package:cost_of_living/presentation/model/location_view_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsBloc extends Cubit<LocationsState> {
  LocationsBloc() : super(LocationsLoading());

  void requestLocations() {
    emit(LocationsLoading());

    Future.delayed(const Duration(seconds: 2), () {
      emit(LocationsFetched(locations: [
        toViewData(const LocationModel(
            cityId: 1, cityName: "Bucharest", countryName: "Romania")),
        toViewData(const LocationModel(
            cityId: 2, cityName: "Kyiv", countryName: "Ukraine")),
        toViewData(const LocationModel(
            cityId: 3, cityName: "Warsaw", countryName: "Poland")),
      ]));
    });
  }
}
