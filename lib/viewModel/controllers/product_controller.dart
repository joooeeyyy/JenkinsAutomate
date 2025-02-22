import 'package:architecture/models/product.dart';
import 'package:architecture/viewModel/data_layer/remote_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController{

    var productList = <Product>[].obs;
    List<Product> get listOfProducts => productList;
    static var client = http.Client();

    @override
  void onInit() {
    super.onInit();
    fetchProductsController();
  }

  void fetchProductsController() async {
         print("fetchProductsController triggered");
         var productResponse =  await RemoteServices.fetchProductsService(client:client);
        // print("size of product ${productResponse!.length}");
          productList.value = productResponse!;
    }

}
