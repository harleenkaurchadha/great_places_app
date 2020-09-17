import 'dart:io';                                          //gives us access to work with methods & types to work with file & file systems
import 'package:flutter/foundation.dart';

class PlaceLocation{
  final String latitude;
  final String longitude;
  final String address;

  PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
});
}

class Place{
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;                                           //image is a file on our device

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}