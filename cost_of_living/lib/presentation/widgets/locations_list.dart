import 'package:cost_of_living/presentation/model/location_view_data.dart';
import 'package:cost_of_living/presentation/widgets/location_item.dart';
import 'package:flutter/material.dart';

class LocationsList extends StatefulWidget {
  final List<LocationViewData> elements;

  const LocationsList({Key? key, required this.elements}) : super(key: key);

  @override
  State<LocationsList> createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.elements.length,
      itemBuilder: (context, index) {
        return LocationItem(location: widget.elements[index]);
      },
    );
  }
}
