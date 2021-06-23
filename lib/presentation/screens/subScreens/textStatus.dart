import 'package:flutter/material.dart';

class TextStatus extends StatefulWidget {
  @override
  _TextStatusState createState() => _TextStatusState();
}

class _TextStatusState extends State<TextStatus> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title:Text('Test')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(

              decoration: InputDecoration(
                hintText: "Insert your message",
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
              scrollPadding: EdgeInsets.all(20.0),
              keyboardType: TextInputType.multiline,
              autofocus: true,
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FloatingActionButton(
                  heroTag: "smile",
                  mini: true,
                  backgroundColor: Color(0xff128C7E),
                  child:
                      IconButton(icon: Image.asset('assets/icons/smile.png')),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 10.0,
                ),
                FloatingActionButton(
                  backgroundColor: Color(0xff128C7E),
                  heroTag: "paint",
                  mini: true,
                  child: IconButton(
                    icon: IconButton(
                      icon: Image.asset(
                        'assets/icons/paint.png',
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                FloatingActionButton(
                  heroTag: "text",
                  mini: true,
                  backgroundColor: Color(0xff128C7E),
                  child: IconButton(
                    icon: IconButton(
                        icon: Image.asset(
                      'assets/icons/text.png',
                      color: Colors.white,
                    )),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
