import "dart:convert"; // It's for jsonDecode();
import "package:http/http.dart" as http;

class AllPages {
  var url = "https://internetkidunya.com/wp-json/wp/v2/pages";

  Future<List> getPages() async {
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return Future.error("Server Error");
    }
  }
}
