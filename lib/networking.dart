import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';


class Networking {

  Future<dynamic> getcityName(String cityName) async{

    Position position = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,);
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=9deaea866eaa2a615e3777bc2e04c0cb&units=metric');
    var data = await response.body;
    return data;

  }


  Future<dynamic> getData() async {
    Position position = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,);
    Response response = await get(
        'http://api.openweathermap.org/data/2.5/weather?lat=${position
            .latitude}&lon=${position
            .longitude}&appid=9deaea866eaa2a615e3777bc2e04c0cb&units=metric');
    var data = await response.body;
    return data;
  }
}