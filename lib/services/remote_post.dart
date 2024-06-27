import 'package:shopvippro_demo/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Product>?> getProduct() async {
    var client = http.Client();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return productFromJson(json);
    }
  }
}
