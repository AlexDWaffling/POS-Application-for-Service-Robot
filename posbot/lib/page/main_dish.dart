import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:posbot/constants/controllers.dart';  

import '../constants/constant_app.dart';
import '../controllers/productController.dart';
import '../entity/item.dart';
import '../home.dart';
import '../widgets/item_list.dart';

class mainDishTab extends StatelessWidget {
  List<ProductItem> cItem = [];

  final dynamic getFunc;

  mainDishTab({Key? key, required this.cItem, required this.getFunc}) : super(key: key);
  
  final ProductsController _productsController = Get.put(ProductsController());
  // final OrderController _orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    RxList<ProductItem> productsCtg = _productsController.getAllItemsByCategory('Main');
    return Obx(() => GridView.builder(
        itemCount: productsCtg.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: (1 / 1.2)),
        itemBuilder: (context, index) {

          // logger.i({"Length": _productsController.products.length});
          // logger.i({"Products": _productsController.products[index].toString()});
            
            return itemList(
                image: productsCtg[index].image,
                title: productsCtg[index].name,
                price: '${_productsController.formatter.format(productsCtg[index].price.toInt())} VND',
                quantity: productsCtg[index].quantity,
                tap: () {
                  // cItem.add(productsCtg[index]);
                  //getFunc(productsCtg[index]);
                  _productsController.addItemOrder(productsCtg[index]);
                  Get.to(const HomePage());
                });
        })
    );
  }
}
