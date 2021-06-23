import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsme/data/model/chatroom.dart';
import 'package:whatsme/presentation/bloc/chatbloc/chat_bloc.dart';
import 'package:whatsme/presentation/bloc/searchbloc/search_bloc.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  SearchBloc searchbloc;
  ChatBloc chatbloc;
  void initState() {
    chatbloc = ChatBloc();
    chatbloc.add(FetchChatEvent());
    searchbloc = SearchBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocBuilder(
            bloc: chatbloc,
            builder: (context, snapshot) {
              print('state$snapshot');

              if (snapshot is ChatLoadedState) {
                return buildChatList(snapshot.chatScreen, context);
              } else if (snapshot is ChatErrorState) {
                return buildErrorUi(snapshot.message);
              }
              return showCircleProgress();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff25D366),
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget buildChatList(List<Chatroom> chatScreen, BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: chatScreen?.length ?? "",
      itemBuilder: (context, position) => Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: <Widget>[
            InkWell(
              child: ListTile(
                  visualDensity: VisualDensity(horizontal: 4.0, vertical: 2.0),
                  leading: Transform.translate(
                    offset: Offset(-26, 0),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                          backgroundImage: (chatScreen[position].image == null
                              ? NetworkImage(
                                  "https://unbxd.com/wp-content/uploads/2020/02/blog.png")
                              : NetworkImage(chatScreen[position].image))),
                    ),
                  ),
                  title: Transform.translate(
                      offset: Offset(-50, 0),
                      child: Text('${chatScreen[position]?.name ?? ""}')),
                  subtitle: Transform.translate(
                      offset: Offset(-50, 0),
                      child: Text('${chatScreen[position]?.message ?? ""}')),
                  trailing: Text('${chatScreen[position]?.status ?? ""}')),
              onTap: () {},
            ),
            Divider(
              height: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget buildErrorUi(String message) {
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
  /*void onItemChanged(String value) {
    setState(() {

      searchbloc.add(FetchSearchEvent(paramsearch: {
        "searchstring": _textController.text,
      }));

    });
  }*/
}
