import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/Appeonix/AndroidStudioProjects/whatsme/lib/presentation/screens/homeScreens/calls.dart';
import 'package:whatsme/presentation/screens/camera/camera.dart';
import 'file:///C:/Users/Appeonix/AndroidStudioProjects/whatsme/lib/presentation/screens/homeScreens/chats.dart';
import 'file:///C:/Users/Appeonix/AndroidStudioProjects/whatsme/lib/presentation/screens/homeScreens/status.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            title: Text(
              'WhatsMe',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xff075E54),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                  icon: Image.asset(
                    'assets/icons/dot_menu.png',
                    color: Colors.white,
                    height: 20.0,
                  ),
                  onPressed: null),
            ],
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              // indicatorSize: TabBarIndicatorSize.label,
              //  indicator: BoxDecoration(
              //      borderRadius: BorderRadius.only(
              //          topLeft: Radius.circular(10),
              //          topRight: Radius.circular(10)),
              //      color: Colors.white),
              indicatorColor: Colors.white,

              tabs: [
                Tab(
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white54,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("CHATS"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("STATUS"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("CALLS"),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            CameraScreen(),
            Chats(),
            Status(),
            Calls(),
          ],
        ),
      ),
    );
  }
}
