import 'cityscreen.dart';
import 'networking.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main.dart';


class LocationScreen extends StatefulWidget {

  final locationweather;
  LocationScreen(this.locationweather);


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>{

  Networking networking = Networking();

  double temp;
  int condt;
  String city;

@override
  void initState() {
    super.initState();
    updateui(widget.locationweather);
  }

  void updateui(dynamic data ){
  setState(() {

    if (data == null) {
      temp = 0;
      city = '';
      condt = 0;
      return;
    }


    double temperature =  jsonDecode(data)['main']['temp'];
    temp =  temperature;
     var condition =   jsonDecode(data)['weather'][0]['id'];
    condt = condition;
    var cityName =   jsonDecode(data)['name'];
    city  = cityName;
  });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () async{
                  var data = await networking.getData();
                  updateui(data);
                  },
                child: Icon(
                  Icons.near_me,
                  size: 30,
                ),
              ),
              FlatButton(
                onPressed: ()async {
                  var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                 return CityScreen();
                  }));

               var data = await networking.getcityName(typedName);
               updateui(data);


                 },
                child: Icon(
                  Icons.location_city,
                  size: 30,
                ),
              )
            ],
          ),

          Text(
            '$temp',
            style: TextStyle(
              fontSize: 80,
            ),
          ),

          Text(
            '$condt',
            style: TextStyle(
              fontSize: 80,
            ),
          ),



          Padding(
            padding:  EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Text(
              '$city',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          )

        ]
        ,
      ),
    );
  }
}
