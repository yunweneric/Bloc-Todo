import 'package:http/http.dart' as http;

class TodoApi {
  final baseUrl = "127.0.0.1";
  // final baseUrl = "localhost:3000/";
  Future addApiTodo({required String api_todo}) async {
    var url = Uri.http(baseUrl, '/todos');
    try {
      var response = await http.post(
        url,
        headers: {'accept': 'application/json'},
        body: {"todo": api_todo},
      );
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(" This is adding todo error ${e}");
      return e;
    }
  }

  Future getTodos() async {
    var url = Uri.http(baseUrl, '/todos');
    print(" This is adding todo error ${url}");

    try {
      var response = await http.get(
        url,
        headers: {'accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(" This is adding todo error ${e}");
      return e;
    }
  }
}
