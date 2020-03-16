import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_design/Models/ChatUser.dart';

class InChatScreen extends StatefulWidget {
  ChatUser user;

  InChatScreen({@required this.user});
  @override
  _InChatScreenState createState() => _InChatScreenState();
}

class _InChatScreenState extends State<InChatScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.videocam), onPressed: () {}),
          new IconButton(icon: new Icon(Icons.call), onPressed: () {}),
          new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {}),
        ],
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(60.0)),
              width: ScreenUtil().setWidth(165.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                    child: new IconButton(
                        icon: new Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  new ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      widget.user.imageURL,
                      fit: BoxFit.cover,
                      height: ScreenUtil().setHeight(55.0),
                      width: ScreenUtil().setWidth(67.0),
                    ),
                  ),
                  new SizedBox(width: ScreenUtil().setWidth(2.0))
                ],
              ),
            ),
            new Expanded(
              child: new Container(
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(10.0), 0.0, 0.0, 0.0),
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: new Text(
                  widget.user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(fontSize: ScreenUtil().setSp(30.0)),
                ),
              ),
            )
          ],
        ),
        // /leading: new SizedBox(width: 0.0,),
      ),
    );
  }
}
