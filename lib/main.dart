import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/screens/HomePage.dart';
void main(){
  runApp(WhatsMe());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));

}
class WhatsMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
