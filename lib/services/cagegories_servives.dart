// ignore_for_file: camel_case_types, missing_required_param

import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';

class cagegories_servives {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    //
    // http.Response response = await http.get(
    //     Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));

    // //التحقق من نجاح الاتصال
    // List<dynamic> data = jsonDecode(response.body);
    //الاتصال بالكلاس وفحص  الاتصال ارجاع بيانات بشكل جيسون
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
