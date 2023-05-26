import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'location_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final LocationService _locationService = LocationService();

  final double _zoom = 11.0;
  final _center = LatLng(37.5642135, 127.0016985); // Seoul

  late List<LatLng> _coords;
  late List<Marker> _markers;

  @override
  void initState() {
    super.initState();

    _coords = [
      LatLng(37.514575, 127.0495556), // 서울강남구
      LatLng(37.52736667, 127.1258639), // 서울강동구
      LatLng(37.63695556, 127.0277194), // 서울강북구
      LatLng(37.54815556, 126.851675), // 서울강서구
      LatLng(37.47538611, 126.9538444), // 서울관악구
      LatLng(37.53573889, 127.0845333), // 서울광진구
      LatLng(37.49265, 126.8895972), // 서울구로구
      LatLng(37.44910833, 126.9041972), // 서울금천구
      LatLng(37.65146111, 127.0583889), // 서울노원구
      LatLng(37.66583333, 127.0495222), // 서울도봉구
      LatLng(37.571625, 127.0421417), // 서울동대문구
      LatLng(37.50965556, 126.941575), // 서울동작구
      LatLng(37.56070556, 126.9105306), // 서울마포구
      LatLng(37.57636667, 126.9388972), // 서울서대문구
      LatLng(37.48078611, 127.0348111), // 서울서초구
      LatLng(37.56061111, 127.039), // 서울성동구
      LatLng(37.58638333, 127.0203333), // 서울성북구
      LatLng(37.51175556, 127.1079306), // 서울송파구
      LatLng(37.51423056, 126.8687083), // 서울양천구
      LatLng(37.52361111, 126.8983417), // 서울영등포구
      LatLng(37.53609444, 126.9675222), // 서울용산구
      LatLng(37.59996944, 126.9312417), // 서울은평구
      LatLng(37.57037778, 126.9816417), // 서울종로구
      LatLng(37.56100278, 126.9996417), // 서울중구
      LatLng(37.6038055, 127.0947778), // 서울중랑구
    ];

    _markers = _coords
        .map((point) => Marker(
              point: point,
              width: 80,
              height: 80,
              builder: (context) => const Icon(
                Icons.location_on,
                size: 40,
                color: Colors.red,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Future<LatLng> currentLocation =
              _locationService.getCurrentLocation();

          currentLocation.then((latlng) {
            _mapController.move(latlng, _zoom);
          }).catchError((error) {
            _mapController.move(_center, _zoom);
          });
        },
        child: const Icon(Icons.my_location),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _center,
          zoom: _zoom,
          minZoom: 1,
          maxZoom: 18,
        ),
        children: <Widget>[
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 45,
              size: const Size(40, 40),
              anchor: AnchorPos.align(AnchorAlign.center),
              fitBoundsOptions: const FitBoundsOptions(
                padding: EdgeInsets.all(50),
                maxZoom: 18,
              ),
              markers: _markers,
              builder: (context, markers) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: Center(
                    child: Text(
                      markers.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
