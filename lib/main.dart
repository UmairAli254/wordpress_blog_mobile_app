import "package:flutter/material.dart";
import "package:wordpress/widgets/my_home.dart";

import 'model/all_post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp( 
      title: "WordPress Blog",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 26, 83, 181),
      ),
      home: MyHome(),
    );
  }
}
