import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_design/HomePage.dart';

List<CameraDescription> camera ;

Future<Null> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras() ;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor : Color.fromRGBO(7, 94, 84, 1.0),
        secondaryHeaderColor: Color.fromRGBO(37, 211, 102,1.0),
        highlightColor: Color.fromRGBO(18, 140, 126, 1.0)
        
      ),
      home: HomePage(),
    );
  }
}
