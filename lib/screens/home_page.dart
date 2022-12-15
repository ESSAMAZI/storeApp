import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_services.dart';

import '../widgets/cusom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0, //ظل Appbar
        centerTitle: true,
        title: const Text(
          'New Tren',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        // جلب البيانات من السيرفر
        child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              //فحص اذا توفرت البيانات
              if (snapshot.hasData) {
                // نستقبل البيانات
                List<ProductModel> product = snapshot.data!;

                return GridView.builder(

                    //استخدام البيانات مع الجريد فيو
                    //CustomCard ثم نرسلهاالى
                    itemCount: product.length,
                    clipBehavior: Clip.none,
                    //توزيع العناصر
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, //عدد العناصر التي توزع في شاشه 2 جنب وتحت
                      //(الطول4 - العرض1)التحكم بنسبه العرض لطول تبع الابناءتقلل
                      childAspectRatio: 1.4,
                      crossAxisSpacing:
                          10, // يبعد العناصر عن جنب بعض بحوار اكس العرض
                      mainAxisSpacing:
                          80, // يبعد العناصر عن بعض بمحور يو الاتفاع
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: product[index],
                      );
                    });
              } else {
                return const Center(
                  //اظهار دائره التحميل
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
