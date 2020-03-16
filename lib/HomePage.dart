import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_design/Screens/Calls.dart';
import 'package:whatsapp_design/Screens/Camera.dart';
import 'package:whatsapp_design/Screens/ChatScreen.dart';
import 'package:whatsapp_design/Screens/Status.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this,initialIndex: 1);
    _tabController.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    double tabWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text("WhatsApp"),
          actions: <Widget>[
            new Icon(
              Icons.search,
            ),
            new SizedBox(),
            new Icon(Icons.more_vert)
          ],
          bottom: new TabBar(
            //labelPadding: EdgeInsets.symmetric(horizontal : ScreenUtil().setWidth(100.0)),
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
              new Container(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(15.0)),
                alignment: Alignment.bottomCenter,
                width: ScreenUtil().setWidth(50.0),
                child: Center(
                    child: new Icon(
                  Icons.camera_alt,
                  size: ScreenUtil().setSp(40.0),
                )),
              ),
              new Container(
                  alignment: Alignment.center,
                  width: tabWidth,
                  child: new Text("CHATS")),
              new Container(
                alignment: Alignment.center,
                width: tabWidth,
                child: new Text("STATUS"),
              ),
              new Container(
                alignment: Alignment.center,
                width: tabWidth,
                child: new Text("CALLS"),
              )
            ],
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: [
            new CameraScreen(),
            new ChatScreen(),
            new StatusScreen(),
            new CallsScreen()
          ],
        ),
        floatingActionButton: _buildFAB(_tabController.index));
  }

  Widget _buildFAB(int index) {
    if (index == 1) {
      return new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.message),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      );
    } else if (index == 2) {
      return new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.add_a_photo),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      );
    } else if (index == 3) {
      return new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.add_call),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      );
    }
  }
  @override
  void dispose(){
    _tabController.dispose() ;
    super.dispose() ;
  }
}
