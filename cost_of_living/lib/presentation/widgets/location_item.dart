import 'package:cost_of_living/presentation/model/location_view_data.dart';
import 'package:flutter/material.dart';

class LocationItem extends StatefulWidget {
  final LocationViewData location;

  const LocationItem({Key? key, required this.location}) : super(key: key);

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.amber,
      child: SizedBox(
        width: 300,
        height: 100,
        child: Center(
            child: Text(
                "${widget.location.countryName} ${widget.location.cityName}")),
      ),
    );
  }
}
