import 'package:cost_of_living/domain/bloc/LocationsBloc.dart';
import 'package:cost_of_living/domain/bloc/state/locations_state.dart';
import 'package:cost_of_living/presentation/widgets/locations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/LocationsRepositoryImpl.dart';

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
              const Text(
                "List of locations",
                textAlign: TextAlign.center,
              ),
              BlocBuilder<LocationsBloc, LocationsState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case LocationsFetched:
                      {
                        return LocationsList(
                            elements: (state as LocationsFetched).locations);
                      }
                    case LocationsLoading:
                      {
                        BlocProvider.of<LocationsBloc>(context)
                            .requestLocations();
                        return const Text("Locations loading");
                      }

                    default:
                      {
                        return const Text("Unsupported state");
                      }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
