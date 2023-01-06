import 'package:cost_of_living/presentation/model/location_view_data.dart';
import 'package:flutter/material.dart';

class LocationItem extends StatefulWidget {
  final LocationViewData location;
  final VoidCallback onItemClicked;

  const LocationItem(
      {Key? key, required this.location, required, required this.onItemClicked})
      : super(key: key);

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onItemClicked(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 0,
          child: Container(
            height: 80,
            child: Center(
                child: Text(
                    "${widget.location.countryName} ${widget.location.cityName}")),
          ),
        ),
      ),
    );
  }
}
