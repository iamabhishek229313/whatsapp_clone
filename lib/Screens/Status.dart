import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new ListTile(
          title: new Text("My status",
              style: new TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenUtil().setSp(33.0))),
          subtitle: new Text(
            'Today , 10:02 am',
            style: new TextStyle(
              color: Colors.grey,
            ),
          ),
          leading: new Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(50.0),
                border: Border.all(
                  width: 2.0,
                  color: Theme.of(context).primaryColor,
                )),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(50.0),
              child: new Image(
                  fit: BoxFit.cover,
                  width: ScreenUtil().setWidth(104.0),
                  height: ScreenUtil().setHeight(95.0),
                  image: new AssetImage('assets/images/person1.jpeg')),
            ),
          ),
        )
      ],
    );
  }
}
