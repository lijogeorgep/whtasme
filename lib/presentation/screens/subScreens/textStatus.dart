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
                border:InputBorder.none,

              ),
              scrollPadding: EdgeInsets.all(20.0),
              keyboardType: TextInputType.multiline,

              autofocus: true,),
          ],
        ),
      ),
    );
  }
}
