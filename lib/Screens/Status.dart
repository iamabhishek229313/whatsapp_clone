import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_design/Models/ChatUser.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<Widget> _statusList(int d) {
    List<Widget> _viewedStatus = new List();

    for (int i = 0; i < d; i++) {
      _viewedStatus.add(new ListTile(
        title: new Text("data"),
        subtitle: new Text("datdatadatadatadatadatadataa"),
      ));
    }
    return _viewedStatus;
  }

  bool _mutedVisibility = false;
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
                  width: 3.0,
                  color: Theme.of(context).secondaryHeaderColor,
                )),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(50.0),
              child: new Image(
                  fit: BoxFit.cover,
                  width: ScreenUtil().setWidth(95.0),
                  height: ScreenUtil().setHeight(100.0),
                  image: new AssetImage('assets/images/person1.jpeg')),
            ),
          ),
        ),
        new Container(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(20.0)),
          height: ScreenUtil().setHeight(45.0),
          color: Colors.grey.shade300,
          child: new Align(
            alignment: Alignment.centerLeft,
            child: new Text(
              "Viewed updates",
              style: new TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        new ListBody(
          children: List.generate(dummyMsg.length - 6, (index) {
            return Column(
              children: <Widget>[
                new ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        dummyMsg[index].name,
                        style: new TextStyle(
                            fontSize: ScreenUtil().setSp(33.0),
                            fontWeight: FontWeight.w700),
                      ),
                      new SizedBox(
                        height: ScreenUtil().setHeight(10.0),
                      )
                    ],
                  ),
                  subtitle: new Text("Today, 12:56PM"),
                  leading: new Container(
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(50.0),
                        border: new Border.all(width: 3.0, color: Colors.grey)),
                    child: new ClipRRect(
                      borderRadius: new BorderRadius.circular(50.0),
                      child: new Image(
                          fit: BoxFit.cover,
                          width: ScreenUtil().setWidth(95.0),
                          height: ScreenUtil().setHeight(100.0),
                          image: new AssetImage(dummyMsg[index].imageURL)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
                  child: new Divider(
                    height: 1.0,
                    indent: ScreenUtil().setWidth(150.0),
                  ),
                )
              ],
            );
          }),
        ),
        new GestureDetector(
          onTap: () {
            setState(() {
              _mutedVisibility = !_mutedVisibility;
            });
          },
          child: new Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20.0),
                right: ScreenUtil().setWidth(20.0)),
            height: ScreenUtil().setHeight(45.0),
            color: Colors.grey.shade300,
            child: new Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Muted updates",
                    style: new TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  new Icon(
                    !_mutedVisibility
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
        _mutedVisibility
            ? new DecoratedBox(
                decoration: new BoxDecoration(
                    color: Colors.pink,
                    gradient: new LinearGradient(
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.6),
                          Color.fromRGBO(255, 255, 255, 0.6)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1.0])),
                child: new ListBody(
                  children: List.generate(3, (index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                dummyMsg[index].name,
                                style: new TextStyle(
                                    fontSize: ScreenUtil().setSp(33.0),
                                    fontWeight: FontWeight.w700),
                              ),
                              new SizedBox(
                                height: ScreenUtil().setHeight(10.0),
                              )
                            ],
                          ),
                          subtitle: new Text("Today, 12:56PM"),
                          leading: new Container(
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(50.0),
                                border: new Border.all(
                                    width: 3.0, color: Colors.grey)),
                            child: new ClipRRect(
                              borderRadius: new BorderRadius.circular(50.0),
                              child: new Image(
                                  fit: BoxFit.cover,
                                  width: ScreenUtil().setWidth(95.0),
                                  height: ScreenUtil().setHeight(100.0),
                                  image:
                                      new AssetImage(dummyMsg[index].imageURL)),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(
                              right: ScreenUtil().setWidth(20.0)),
                          child: new Divider(
                            height: 1.0,
                            indent: ScreenUtil().setWidth(150.0),
                          ),
                        )
                      ],
                    );
                  }),
                ),
              )
            : new Container(
                height: 120.0,
              )
      ],
    );
  }
}
