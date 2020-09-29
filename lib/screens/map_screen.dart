import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';

class MapScreen extends StatefulWidget{
  final PlaceLocation initialLocation;
  final bool isSelecting;                                //whether we r selecting a place(tap on map) or showing already selected place(read only)

  MapScreen({
    this.initialLocation = const PlaceLocation(
        latitude: 37.422,
        longitude: -122.084
    ),
    this.isSelecting = false
  });                //assigning default values
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _selectLocation(LatLng position){
   setState(() {
     _pickedLocation = position;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: <Widget>[
          if(widget.isSelecting)
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _pickedLocation == null ? null
                :() {
              Navigator.of(context).pop(_pickedLocation);
            },
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(                                //location which is focused when app launches
         target: LatLng(
           widget.initialLocation.latitude,
           widget.initialLocation.longitude,
         ),
          zoom: 16,
        ),
         onTap: widget.isSelecting ? _selectLocation : null,
         markers: (_pickedLocation == null && widget.isSelecting) ? null        //since if isSelecting is false then marker should be already placed
             : {                                                   //we r using set since in a set every value is unique & cannot be repeated
            Marker(
                markerId: MarkerId('m1'),
                position: _pickedLocation ?? LatLng(            //if our selecting mode is false then we will point marker at initial location
                    widget.initialLocation.latitude,
                    widget.initialLocation.longitude,
                ),
            ),
         },
      ),
    );
  }
}