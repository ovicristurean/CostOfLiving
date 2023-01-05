import 'package:cost_of_living/presentation/model/location_view_data.dart';
import 'package:cost_of_living/presentation/widgets/location_item.dart';
import 'package:flutter/material.dart';

class LocationsList extends StatelessWidget {
  final List<LocationViewData> elements;

  const LocationsList({Key? key, required this.elements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: elements.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return LocationItem(location: elements[index]);
      },
    );
  }
}
