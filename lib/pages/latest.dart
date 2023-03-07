import "package:flutter/material.dart";
import "package:wordpress/pages/single_post.dart";
import "package:http/http.dart" as http;
import "../model/all_post.dart";
// import "package:webview_flutter/webview_flutter.dart";
// import "package:flutter_html/flutter_html.dart";

class Latest extends StatefulWidget {
  @override
  _LatestState createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  var aob = AllPost();
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 231, 231, 231),
      color: Color(0xFFF2F2F2),
      child: FutureBuilder(
          future: aob.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
// Remove html tags and inline css from the paragraph
                    final pattern = RegExp(r'<[^>]*>|style=[^>]*');
                    final withoutHtml = snapshot.data![i]['content']['rendered']
                        .replaceAll(pattern, '');
// End of  Remove html tags and inline css from the paragraph

                    return Container(
                      // color: Colors.white,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(children: [
                        GestureDetector(
                          onTap: () {
                            // print("Open Post");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SinglePost(
                                    snapshot.data![i],
                                  );
                                },
                              ),
                            );
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                // color: Colors.white,
                              ),
                              // padding: const EdgeInsets.all(10),
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 20),
                              // height: 360,
                              // color: Color(0xFFF2F2F2),

                              width: 400,
                              child: Column(
                                children: [
                                  Image(
                                    image: NetworkImage(snapshot.data![i]
                                            ["_embedded"]["wp:featuredmedia"][0]
                                        ["source_url"]),
                                    height: 200,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    snapshot.data![i]['title']['rendered'],
                                    style: TextStyle(
                                      fontSize: 27 *
                                          MediaQuery.of(context)
                                              .textScaleFactor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    // textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    withoutHtml,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20 *
                                          MediaQuery.of(context)
                                              .textScaleFactor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                    );
                  });
            } else {
              return Center(
                child: Text("No Data Found!"),
              );
            }
          }),
    );
  }
}
