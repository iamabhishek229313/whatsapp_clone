import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_design/Models/CallsDetails.dart';

class CallsScreen extends StatefulWidget {
  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: List.generate(listOfCalls.length, (index) {
      return Column(
        children: <Widget>[
          new ListTile(
            title: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  listOfCalls[index].name,
                  style: new TextStyle(
                      fontSize: ScreenUtil().setSp(33.0),
                      fontWeight: FontWeight.w700),
                ),
                new SizedBox(
                  height: ScreenUtil().setHeight(10.0),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                listOfCalls[index].incomingTrue
                    ? new Icon(
                        Icons.call_received,
                        size: ScreenUtil().setWidth(30.0),
                        color: Colors.red.shade700,
                      )
                    : new Icon(
                        Icons.call_made,
                        size: ScreenUtil().setWidth(30.0),
                        color: Colors.green.shade700,
                      ),
                listOfCalls[index].times > 0
                    ? new Text(" (${listOfCalls[index].times}) ")
                    : new Text(""),
                new Text(listOfCalls[index].date_and_time),
              ],
            ),
            leading: new Container(
              child: new ClipRRect(
                borderRadius:
                    new BorderRadius.circular(ScreenUtil().setWidth(70.0)),
                child: new Image(
                  fit: BoxFit.cover,
                  width: ScreenUtil().setWidth(98.0),
                  height: ScreenUtil().setHeight(100.0),
                  image: new AssetImage(listOfCalls[index].imageURL),
                ),
              ),
            ),
            trailing: new IconButton(
              icon: listOfCalls[index].callTrue ? new Icon(
                Icons.call , color: Theme.of(context).primaryColor,
              ) : new Icon(
                Icons.videocam , color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
            child: new Divider(
              indent: ScreenUtil().setWidth(150.0),
              height: 1.0,
            ),
          )
        ],
      );
    }));
  }
}
