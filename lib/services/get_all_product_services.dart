// ignore_for_file: missing_required_param

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  // انشاء داله من نوع بياني مودل منتجات
  Future<List<ProductModel>> getAllProducts() async {
    /*
  params  الاتصال ب 
   Get نسخ اربط ال 
   https://fakestoreapi.com/products
    */
    // ننسخ الرابط ثم نحوله الى رابط لكي نستطيع التعامل معه
    // http.Response response =
    //     await http.get(Uri.parse('https://fakestoreapi.com/products'));
    // http.Response response =await
    //     Api().get(url: 'https://fakestoreapi.com/products');

    // List تحويل البيانات التي تاتي من الانترنت الى جيسون واضافتها الى قائمه

    //List<dynamic> data = jsonDecode(response.body);

    // list انشاء قائمه

    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
