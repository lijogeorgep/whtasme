import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'file:///C:/Users/Appeonix/AndroidStudioProjects/whatsme/lib/presentation/screens/homeScreens/calls.dart';
import 'package:whatsme/presentation/screens/camera/camera.dart';
import 'file:///C:/Users/Appeonix/AndroidStudioProjects/whatsme/lib/presentation/screens/homeScreens/chats.dart';
import 'file:///C:/Users/Appeonix/AndroidStudioProjects/whatsme/lib/presentation/screens/homeScreens/status.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _menuitems = [
    "NewGroup",
    "New broadcast",
    "WhatsApp Web",
    "Starred messages",
    "Payments",
    "Settings"
  ];
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
                  onPressed: () {
                    var menuDialog = Align(
                      alignment: Alignment(0, 1),
                      child: Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12.0)), //this right here
                        child: Stack(
                          children: [
                            Container(
                              child: ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _menuitems.length,
                                itemBuilder: (context, position) => Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: ListTile(
                                    title: Text(_menuitems[position]),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -100.0,
                              left: 0.0,
                              right: 0.0,
                              bottom: 0.0,
                              child: Text(''),
                            )
                          ],
                        ),
                      ),
                    );

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return menuDialog;
                        });
                  }),
            ],
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
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
