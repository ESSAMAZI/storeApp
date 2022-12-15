// ignore_for_file: camel_case_types, missing_required_param

/*
[
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
]
 */
//   لم نستخدم مودل لانه بيانات وصفيه

import '../helper/api.dart';

class All_CategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    // http.Response response = await http
    //     .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    //   List<dynamic> data = jsonDecode(response.body);
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
