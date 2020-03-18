import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_design/Models/ChatUser.dart';
import 'package:whatsapp_design/Screens/InChatScreen.dart';

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
          return new Container(
              margin: index == 0
                  ? EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(20.0),
                      ScreenUtil().setHeight(10.0),
                      ScreenUtil().setWidth(20.0),
                      ScreenUtil().setHeight(0.0))
                  : EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20.0)),
              height: ScreenUtil().setHeight(120.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ClipRRect(
                    borderRadius: new BorderRadius.circular(50.0),
                    child: new Image(
                      fit: BoxFit.cover,
                      image: new AssetImage(dummyMsg[index].imageURL),
                      width: ScreenUtil().setWidth(104.0),
                      height: ScreenUtil().setHeight(90.0),
                    ),
                  ),
                  new SizedBox(
                    width: ScreenUtil().setWidth(30.0),
                  ),
                  new Expanded(
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    InChatScreen(user: dummyMsg[index])));
                      },
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                width: ScreenUtil().setWidth(400.0),
                                child: new Text(
                                  dummyMsg[index].name,
                                  style: new TextStyle(
                                      fontSize: ScreenUtil().setSp(32.0),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              new Text(
                                dummyMsg[index].time,
                                style: new TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenUtil().setSp(21.0),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          new SizedBox(height: ScreenUtil().setHeight(8.0)),
                          new Container(
                            width: ScreenUtil().setWidth(500.0),
                            child: new Text(
                              dummyMsg[index].message,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: ScreenUtil().setSp(25.0)),
                            ),
                          ),
                          new SizedBox(height: ScreenUtil().setHeight(15.0)),
                          new Container(
                              width: ScreenUtil().setWidth(550.0),
                              child: new Divider())
                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
