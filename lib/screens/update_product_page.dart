// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_Field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);
  static String id = 'upate product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, decs, image;

  String? price;

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    //استقبال البيانات التي ترسل من شاشة التي تحدد قسم المنتجات
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent, //تلوين حسب المتنج
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          //SingleChildScrollView حل مشكله خروج العناصر عن محتوى
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 90,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    decs = data;
                  },
                  hintText: 'description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  inputType: TextInputType.number,
                  hintText: ' price',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'image',
                ),
                const SizedBox(height: 30),
                CustomButton(
                  textb: 'Update',
                  onTap: () {
                    isloading = true;
                    setState(() {});
                    updateProduct(product);
                    try {
                      print('success');
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                    isloading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        //فحص البيانات هل هي فارغة او لا في حاله انها فارغة نعطي لها
        //الاسم الافتراضي لهااو نرسل البيانات الجديده
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: decs == null ? product.description : decs!,
        image: image == null ? product.image : image!,
        //مش من المنطق ان نعدل اقسام المنتجات
        category: product.category);
  }
}
