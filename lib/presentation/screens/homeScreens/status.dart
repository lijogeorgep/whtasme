import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsme/presentation/bloc/statusbloc/status_bloc.dart';
import 'package:whatsme/presentation/screens/camera/camera.dart';
import 'package:whatsme/presentation/screens/subScreens/textStatus.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  StatusBloc statusbloc;
  void initState() {
    statusbloc = StatusBloc();
    statusbloc.add(FetchStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: ListTile(
                leading: Transform.translate(
                  offset: Offset(-36, 0),
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/hrx.jpg'),
                        ),
                        Positioned(
                            bottom: -18,
                            right: 1,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 1.0,
                              visualDensity: VisualDensity.compact,
                              fillColor: Color(0xff25D366),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              shape: CircleBorder(),
                            )),
                      ],
                    ),
                  ),
                ),
                title: Transform.translate(
                  offset: Offset(-60, 0),
                  child: Text(
                    'My Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Transform.translate(
                  offset: Offset(-60, 0),
                  child: Text('Tap to add status update'),
                ),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Recent updates',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                )),
            BlocBuilder(
                bloc: statusbloc,
                builder: (context, snapshot) {
                  print('state$snapshot');

                  if (snapshot is StatusLoadedState) {
                    return buildStatusList(snapshot.statusScreen, context);
                  } else if (snapshot is StatusErrorState) {
                    return buildErrorUi(snapshot.message);
                  }
                  return showCircleProgress();
                }),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  heroTag: "edit",
                  backgroundColor: Colors.white70,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xff075E54),
                    ),
                  ),
                  onPressed: () {
 Navigator.push(context, MaterialPageRoute(builder: (context)=>TextStatus()));
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FloatingActionButton(
                heroTag: "camera",
                backgroundColor: Color(0xff25D366),
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CameraScreen()));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildStatusList(statusScreen, BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: statusScreen?.length ?? "",
      itemBuilder: (context, position) => Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Transform.translate(
                offset: Offset(-36, 0),
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                          backgroundImage: (statusScreen[position].image == null
                              ? NetworkImage(
                                  "https://unbxd.com/wp-content/uploads/2020/02/blog.png")
                              : NetworkImage(statusScreen[position].image))),
                    ],
                  ),
                ),
              ),
              title: Transform.translate(
                offset: Offset(-60, 0),
                child: Text('${statusScreen[position]?.name ?? ""}'),
              ),
              subtitle: Transform.translate(
                offset: Offset(-60, 0),
                child: Text('Today ${statusScreen[position]?.status ?? ""}'),
              ),
            ),
            Divider(
              height: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget buildErrorUi(message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "No data found",
        ),
      ),
    );
  }

  Widget showCircleProgress({double size = 30}) => Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            backgroundColor: Color(0xff128C7E),
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
}
