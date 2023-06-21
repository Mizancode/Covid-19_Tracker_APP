import 'dart:async';

import 'package:covid_19_tracker/Screens/statsScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController controller=AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StatsScreen()));
    });
    dispose(){
      controller.dispose();
    }
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xff414a4c),
      body: Container(
        height: mediaQuery.size.height*1,
        width: mediaQuery.size.width*1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: controller,
                builder: (context,child){
                  return Transform.rotate(
                      angle: controller.value*2.0*math.pi,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/images/virus.png'),
                    ),
                  );
                }
            ),
            SizedBox(
              height: mediaQuery.size.height*0.02,
            ),
            Text('Covid-19\nTracker App',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}