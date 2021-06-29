import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'networking.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}


class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

@override
  void initState() {
    super.initState();
    getcurrentLocation();
}





void getcurrentLocation() async {

  Networking networking = Networking();
  var data = await networking.getData();
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(data);
  })) ;
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SpinKitRipple(
                color: Colors.yellowAccent,
                size: 80,
              ),

            Text(
                  'please wait for a while',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white),
                ),
            ],
        ),
      ),
    );
  }
}
