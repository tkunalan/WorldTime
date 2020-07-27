import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Colombo',url: 'Asia/Colombo',flag: 'clolombo.png');
    await worldTime.getTime();
    // clear stack of loading
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      'location': worldTime.location,
      'time' : worldTime.time,
      'flag' : worldTime.flag,
      'isDayTime' : worldTime.isDayTime
    });
    //print(offSet);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
        child:  SpinKitCircle(
          color:  Colors.grey[600],
          size: 60.0,

        ),
      )
    );
  }
}
