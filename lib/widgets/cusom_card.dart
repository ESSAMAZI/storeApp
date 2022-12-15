// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    Key? key,
    required this.product,
  }) : super(key: key);

// نستقبل البيانات
  ProductModel product;
  /*
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: RatingModel.fromJson(jsonData['rating']));
  }
  */
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //التعديل
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductPage.id,
          //نبعث قيمه المتغير الى الشاشة الاخرى
          arguments: product,
        );
      },
      child: Stack(
        //اظهار الصوره المنتج خارج المحتوى
        clipBehavior: Clip.none,
        // وضع العناصر فوق بعض من
        //  العنصر الى يكون الاول الكود يكون اخر شي في التصميم
        children: [
          Container(
            // height: 130,
            // width: 220,
            // //التحكم في الشادو
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40, // حده الشادو
                color: Colors.grey.withOpacity(.2), // درجه اللون
                spreadRadius: 0, // حركه
                offset: const Offset(10, 10), //حركه الشادو x y
              )
            ]),
            child: Card(
              elevation: 10, //عمل شادو لكارد
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15), //مسافه بالحوااف
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // عنصر في البدايبه
                  mainAxisAlignment:
                      MainAxisAlignment.end, //نزول العناصر الى تحت
                  children: [
                    Text(
                        //عرض النصوص التحكم بها
                        product.title.substring(0, 6),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        )),
                    const SizedBox(
                      height: 5, // مسافه بين العنصرين بالارتفاع
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, //المسافة عرضيه
                      children: [
                        Text(r'$' '${product.price.toString()}',
                            style: const TextStyle(
                              //   color: Colors.grey,
                              fontSize: 14,
                            )),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            //تحريك العنصر
            right: 20,
            top: -35,
            child: Image.network(
              //التعامل مع الصوره
              product.image,
              height: 90, width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
