import "package:flutter/material.dart";
import "package:wordpress/pages/single_post.dart";
import "../model/all_pages.dart";
import "../pages/single_page.dart";

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var all_pages = AllPages();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Container(
        child: DrawerHeader(
          child: FutureBuilder(
              future: all_pages.getPages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SinglePage(snapshot.data![i]);
                          }));
                        },
                        child: Container(
                          color: const Color.fromARGB(53, 255, 255, 255),
                          alignment: const Alignment(0, 0),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            snapshot.data![i]["title"]["rendered"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20 *
                                    MediaQuery.of(context).textScaleFactor),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text("No Pages Found!"));
                }
              }),
        ),
      ),
    );
  }
}
