import 'dart:convert';
import 'package:http/http.dart' as http;
import 'modelclass.dart';

List<Welcome> jsonList = [];

class APIRepo {
  Future loadPostData() async {
    var data = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    print(data.body);

    var response = jsonDecode(data.body);
    print("abc $response");
    for (var r in response) {
      jsonList.add(Welcome.fromJson(r));
    }
    print("xyz $jsonList");
  }
}
