import "dart:convert"; // It's for jsonDecode();
// import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class AllPost {
  var url = "https://internetkidunya.com/wp-json/wp/v2/posts?_embed&per_page=42";
  // var ok = "http://jsonplaceholder.typicode.com/posts";
 
  Future<List> getPosts() async {
    print("function is caleed!");
    var res = await http.get(Uri.parse(url));
    print("after res");
    print(res);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
      return jsonDecode(res.body);
    } else {
      print("errroring");
      return Future.error("Server Error");
    }
  }
}
