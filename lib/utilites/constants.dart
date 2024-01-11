import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppConstant {
  static String? token = '';

  static String googlemapkey = 'AIzaSyAERrsuLUwaoHiO1di6tZYYMXx1TqbDmnk';
  static CameraPosition kGoogposition = const CameraPosition(
    target: LatLng(30.42796133580664, 31.085749655962),
    zoom: 14.4746,
  );
  static GoogleMapController? googleMapController;
}
