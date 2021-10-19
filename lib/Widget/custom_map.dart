// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, unused_field, prefer_final_fields, must_be_immutable
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapWidget extends StatelessWidget {
  final double lat;
  final double lng;
  final int date;

  CustomGoogleMapWidget({
    Key? key,
    required this.lat,
    required this.lng,
    required this.date,
  }) : super(key: key);

  List<Marker> _markers = <Marker>[];

  @override
  Widget build(BuildContext context) {
    List<Marker> _markers = <Marker>[];

    var time = DateTime.fromMillisecondsSinceEpoch(date);
    var timeFormatter = DateFormat('dd/MM/yyyy HH:mm');
    var timeFormatted = timeFormatter.format(time);

    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(lat, lng),
        infoWindow:
            InfoWindow(title: 'Your Kid Was There At ${timeFormatted}')));

    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.0,
      width: double.infinity,
      child: GoogleMap(
          myLocationEnabled: true,
          initialCameraPosition:
              CameraPosition(target: LatLng(lat, lng), zoom: 15),
          markers: Set<Marker>.of(_markers)),
    );
  }
}
