import 'dart:convert';

import 'package:google_map_proj/direction_response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
class DirectionService {

  Future<DirectionsResponse> getRoute(String key, LatLng origin, LatLng end) async {
    var response = await http.post(Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?key=" +
            key +
            "&units=metric&origin=" +
            origin.latitude.toString() +
            "," +
            origin.longitude.toString() +
            "&destination=" +
            end.latitude.toString() +
            "," +
            end.longitude.toString() +
            "&mode=driving"
    ));
    return DirectionsResponse.fromJson(jsonDecode(response.body));
  }
}