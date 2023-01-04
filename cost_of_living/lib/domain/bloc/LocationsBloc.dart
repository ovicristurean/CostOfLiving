import 'package:cost_of_living/data/repository/LocationsRepository.dart';
import 'package:cost_of_living/domain/bloc/state/locations_state.dart';
import 'package:cost_of_living/presentation/model/location_view_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsBloc extends Cubit<LocationsState> {
  LocationsRepository locationsRepository;

  LocationsBloc(this.locationsRepository) : super(LocationsLoading());

  void requestLocations() {
    emit(LocationsLoading());

    Future.delayed(const Duration(seconds: 2), () {
      locationsRepository.getLocations().then((locations) =>
          emit(LocationsFetched(locations: toViewDataList(locations))));
    });
  }
}
