import "package:http/http.dart" as http;
import "dart:convert";

class DatabaseHelper {
  String url = "http://192.168.76.239:8000/api/";
  //function get
  Future getApi() async {
    var response = await http.get(
      Uri.parse(url + "get-crud"),
      headers: {"Accept": "application/json"},
    );
    return json.decode(response.body)["data"];
  }

  //function post
  void addData(String nameproduct, String price) async {
    http.post(
      Uri.parse(url + "store-crud"),
      body: {
        "nameproduct": "$nameproduct",
        "price": "$price",
      },
    ).then((response) {
      print(response.body);
      print('response status : ${response.statusCode}');
    });
  }

  //function put
  void editData(String nameproduct, String prices, String id) {
    http.put(Uri.parse(url + "put-crud/$id"), body: {
      "nameproduct": "$nameproduct",
      "price": "$prices",
    }).then((response) {
      print(response.body);
      print('response status : ${response.statusCode}');
    });
  }

  //deelete
  void deleteData(int id) {
    http.delete(Uri.parse(url + "destroy-crud/$id")).then((response) {
      print(response.body);
      print('response status : ${response.statusCode}');
    });
  }
}
