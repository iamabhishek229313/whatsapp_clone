import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_design/HomePage.dart';
import 'package:whatsapp_design/Screens/LogInPage.dart';

class SplashScrren extends StatefulWidget {
  @override
  _SplashScrrenState createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {

  @override
  void initState() { 
    super.initState();
    Timer(Duration(
      seconds: 1,
    ), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage())) ;
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Image(
                image: new AssetImage('assets/images/WhatsApp_Logo_4.png')),
          ),
        ],
      ),
    );
  }
}
