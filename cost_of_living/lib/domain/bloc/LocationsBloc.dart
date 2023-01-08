import 'package:cost_of_living/data/repository/LocationsRepository.dart';
import 'package:cost_of_living/data/response/LocationsResponse.dart';
import 'package:cost_of_living/domain/bloc/state/locations_state.dart';
import 'package:cost_of_living/presentation/model/location_view_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsBloc extends Cubit<LocationsState> {
  LocationsRepository locationsRepository;

  LocationsBloc(this.locationsRepository) : super(LocationsLoading()) {
    requestLocations();
  }

  void requestLocations() {
    emit(LocationsLoading());

    locationsRepository.getLocations().then((locationsResponse) {
      switch (locationsResponse.runtimeType) {
        case LocationsSuccessResponse:
          {
            emit(LocationsFetched(
                locations: toViewDataList(
                    (locationsResponse as LocationsSuccessResponse)
                        .locationsDto
                        .locations)));
          }
          break;

        case LocationsErrorResponse:
          {
            emit(LocationsError(
                "Locations unavailable because: ${(locationsResponse as LocationsErrorResponse).message}"));
          }
      }
    });
  }
}
