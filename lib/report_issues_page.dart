import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // google map
import 'package:location/location.dart'; // location package
import 'package:park/detail_page.dart';
// for handling the reporting of issue
class ReportIssuesPage extends StatefulWidget {
  const ReportIssuesPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReportIssuesPageState();
}
// location permission
class _ReportIssuesPageState extends State<ReportIssuesPage> {
  final Location location = Location(); // get the current location
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LatLng? _currentPosition; // device position currently

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }
// request location permisson
  Future<void> _requestPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _getCurrentLocation();
  }
// function to get location
  _getCurrentLocation() async {
    final LocationData locationResult = await location.getLocation();

    if (locationResult.latitude != null && locationResult.longitude != null) {
      setState(() {
        _currentPosition =
            LatLng(locationResult.latitude!, locationResult.longitude!);
      });
    }
    //If latitude and longitude are not null, update the state

  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> _markers = {};//  // Set of markers to be used on the Google Map.
    if (_currentPosition != null) {
      _markers.add(Marker(
        markerId: MarkerId("currentLocation"),
        position: _currentPosition!,
        infoWindow: InfoWindow(title: 'current Location'),
      ));
    }
    // page structure
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff154406),
        centerTitle: true,
        title: const Text('Report issues', style: TextStyle(color: Colors.white, fontSize: 16),),
      ),
      body: _currentPosition == null
          ? const CircularProgressIndicator()
          : Column(
        // button to start reporting
        children: [
          Expanded(child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition!,
              zoom: 14.0,
            ),
            markers: _markers,// marker on the map
          )),
          GestureDetector( // click the container to the issue detail page
            child: Container(
              width: double.infinity,
              height: 40,
              color: Colors.blueGrey,
              child: const Center(
                child: Text('Start report at this location', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailPage(currentPosition: _currentPosition!,)));
            },
          ),
        ],
      ),
    );
  }
}
