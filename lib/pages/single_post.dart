import 'package:flutter/material.dart';

class SinglePost extends StatelessWidget {
  var data;

  SinglePost(this.data);
  @override
  Widget build(BuildContext context) {
    final pattern = RegExp(r'<[^>]*>|style=[^>]*');
    final paragraphWithoutHtml =
        data['content']['rendered'].replaceAll(pattern, '');
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Article"),
      ),
      backgroundColor: Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // height: 360,
                  // color: const Color.fromARGB(121, 208, 208, 208),
                  width: 400,
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage(
                          data["_embedded"]["wp:featuredmedia"][0]
                                  ["source_url"] ??
                              "",
                        ),
                        height: 200,
                      ),
                      SizedBox(height: 5),
                      Text(
                        data['title']['rendered'].toString(),
                        style: TextStyle(
                          fontSize: 27 * MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.w500,
                        ),
                        // textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 7),
                      Text(
                        paragraphWithoutHtml,
                        style: TextStyle(
                          fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
