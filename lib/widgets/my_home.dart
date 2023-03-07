import "dart:convert";
import "package:flutter/material.dart";
import "../pages/latest.dart";
import "my_drawer.dart";
import '../model/all_post.dart';
import "package:http/http.dart" as http;

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  var _drawKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  var data;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    // When we will change any tab via scroll or click then below method will fire (it's default by flutter)
    _tabController.addListener(() {
      // print(_tabController.index = 2);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  } // this function will remove the unnecessary reserve space of the previous tab after changin to new tab

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_tabController.index != 0) {
          _tabController.animateTo(0);
          // _tabController.index = 0;
          return false;
        }
        return true;
      },
      child: Scaffold(
          key: _drawKey,
          appBar: AppBar(
            title: const Text("My Blog"),
            backgroundColor: const Color.fromARGB(255, 26, 83, 181),
            actions: [
              TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              TextButton(
                onPressed: () {
                  _drawKey.currentState!.openEndDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              labelPadding: EdgeInsets.all(15),
              // isScrollable: true,
              labelStyle: TextStyle(
                fontSize: 17 * MediaQuery.of(context).textScaleFactor,
              ),
              tabs: const [
                Text("Latest"),
                Text("FrontEnd"),
                Text("BackEnd"),
              ],
            ),
          ),
          endDrawer: MyDrawer(),
          body: TabBarView(
            controller: _tabController,
            children: [
              Latest(),
              Center(
                child: Text(
                  "Frontend",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  "Backend",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          )),
    );
  }
}
