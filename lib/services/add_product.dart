// ignore_for_file: non_constant_identifier_names, missing_required_param

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

// الارسال
class AddProduct {
  Future<ProductModel> AddProdcut(
      //البيانات التي نريد ان نرسلها
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products', // رابط
      body: {
        // اسماء الحقول التي رح ترسل
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
