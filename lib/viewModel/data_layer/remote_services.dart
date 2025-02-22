
import 'package:architecture/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RemoteServices{

  static var BASE_URL = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

  static Future<List<Product>?> fetchProductsService({required http.Client client}) async {
    var response = await client.get(Uri.parse(BASE_URL));
    if(response.statusCode == 200){
        var jsonString = response.body;
        List<Product> product = productFromJson(jsonString);
        return product;
    }else{
      if (kDebugMode) {
        print("Error Occured ${response.statusCode}");
      }
      return null;
    }
  }

}
