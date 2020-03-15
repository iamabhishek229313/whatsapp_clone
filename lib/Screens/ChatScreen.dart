import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_design/Models/ChatUser.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyMsg.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  dummyMsg[index].name,
                  style: new TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                new SizedBox(height : ScreenUtil().setHeight(8.0)),
              ],
            ),
            subtitle: new Container(
              height: ScreenUtil().setHeight(65.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    dummyMsg[index].message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  new SizedBox(height : ScreenUtil().setHeight(10.0)),
                  new Divider()
                ],
              ),
            ),
            leading: new ClipRRect(
              borderRadius: new BorderRadius.circular(50.0),
              child: new Image(
                  fit: BoxFit.cover,
                  width: ScreenUtil().setWidth(100.0),
                  height: ScreenUtil().setHeight(100.0),
                  image: new AssetImage(dummyMsg[index].imageURL)
                ),
            ),
          );
        });
  }
}
