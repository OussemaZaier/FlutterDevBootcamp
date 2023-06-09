import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkingHelper {
  Uri url;
  NetworkingHelper({required this.url});

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
