import 'package:cost_of_living/domain/bloc/LocationsBloc.dart';
import 'package:cost_of_living/domain/bloc/state/locations_state.dart';
import 'package:cost_of_living/presentation/widgets/location_list_header.dart';
import 'package:cost_of_living/presentation/widgets/locations_error_view.dart';
import 'package:cost_of_living/presentation/widgets/locations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/LocationsRepositoryImpl.dart';
import '../widgets/locations_loading_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => LocationsRepositoryImpl(),
      child: BlocProvider(
        create: (BuildContext context) =>
            LocationsBloc(context.read<LocationsRepositoryImpl>()),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LocationsHeader(),
              Expanded(
                child: BlocBuilder<LocationsBloc, LocationsState>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case LocationsFetched:
                        {
                          return LocationsList(
                            elements: (state as LocationsFetched).locations,
                            onLocationClicked: () {
                              Navigator.of(context).pushNamed('/details');
                            },
                          );
                        }
                      case LocationsLoading:
                        {
                          BlocProvider.of<LocationsBloc>(context)
                              .requestLocations();
                          return const LocationsLoadingView(
                              message: "Loading locations");
                        }

                      case LocationsError:
                        return LocationsErrorView(
                            message: (state as LocationsError).error);
                    }

                    throw Exception(
                        "Locations state must be one of: Loading, Fetched or Error, but found: ${state.runtimeType.toString()}");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
