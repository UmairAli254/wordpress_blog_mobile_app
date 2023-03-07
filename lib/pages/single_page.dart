import 'package:flutter/material.dart';

class SinglePage extends StatelessWidget {
  var data;

  SinglePage(this.data);
  @override
  Widget build(BuildContext context) {
    final pattern = RegExp(r'<[^>]*>|style=[^>]*');
    final paragraphWithoutHtml =
        data['content']['rendered'].replaceAll(pattern, '');
    return Scaffold(
      appBar: AppBar(
        title: Text("Page"),
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

                  width: 400,
                  child: Column(
                    children: [
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
