import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posbot/constants/controllers.dart';
import 'package:provider/provider.dart';

import 'constants/constant_app.dart';
import 'controllers/productController.dart';
import 'entity/item.dart';
import 'models/model_numpad.dart';
import 'models/model_tab.dart';
import 'models/model_table.dart';
import 'page/cocktail.dart';
import 'page/drink.dart';
import 'page/main_dish.dart';
import 'page/side_dish.dart';
import 'page/wine.dart';

import 'widgets/item_order.dart';
import 'widgets/item_order_state.dart';
import 'widgets/item_tab.dart';
import 'widgets/payment_dropdown.dart';
import 'widgets/search_bar.dart';
import 'widgets/top_title.dart';
import 'widgets/top_title_restaurant.dart';

class HomePage extends StatefulWidget {
  // List<ProductItem> cItem = [];
  const HomePage({key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductsController _productsController = Get.put(ProductsController());
  final TableModel _table = Get.put(TableModel());
  final NumPadModel _numpad = Get.put(NumPadModel());
  // final OrderController _orderController = Get.put(OrderController());
  List<ProductItem> cItem = [];
  double totalPrice = 0.0;
  String payment_ = '';
  var payment_method = ['Cast', 'Momo', 'VNPay'];
  // _HomePageState(this.cItem);
  void collectItem(ProductItem _productItem) {
    setState(() {
      cItem.add(_productItem);
    });
  }

  String pageActive = 'Main Dish';
  _tabpageView() {
    switch (pageActive) {
      case 'Main Dish':
        return mainDishTab(cItem: cItem, getFunc: collectItem);
      case 'Side Dish':
        return sideDishTab(cItem: cItem, getFunc: collectItem);
      case 'Drink':
        return drinkTab(cItem: cItem, getFunc: collectItem);
      case 'Cocktail':
        return cocktailTab(cItem: cItem, getFunc: collectItem);
      case 'Wine':
        return wineTab(cItem: cItem, getFunc: collectItem);

      default:
        return mainDishTab(cItem: cItem, getFunc: collectItem);
    }
  }

  _setTabPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 14,
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: topTitleRes(
                        title: 'Demo Restaurant', subTitle: '20 October 2022'),
                  ),
                  // const SizedBox(width: 20),
                  searchBar()
                ],
              ),
              Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child:
                      Consumer<ItemModelTab>(builder: (context, value, child) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.main_items_tab.length,
                        itemBuilder: (context, index) {
                          return itemTab(
                              icon: value.main_items_tab[index][1],
                              title: value.main_items_tab[index][0],
                              isActive: false,
                              tap: () {
                                _setTabPage(value.main_items_tab[index][0]);
                              });
                        });
                  })),
              Expanded(child: _tabpageView()),
            ],
          ),
        ),
        // Expanded(flex: 1, child: Container()),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            width: 1,
            height: double.infinity,
            color: Color.fromRGBO(226, 224, 224, 1),
          ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Obx(
                () => topTitle(
                  title: 'Order',
                  subTitle: 'Table: ${_table.table_number}',
                  sideTitle: 'Seats: ${_numpad.count_s}',
                  action: Container(),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child: itemOrderS()),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sub Total (VND)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                          Obx(
                            () => Text(
                              _productsController.formatter.format(
                                  producsController.sumPrice.toDouble()),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(18, 19, 25, 1)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Tax (VAT)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                          Text(
                            '8%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Voucher',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                          Text(
                            '0%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        height: 2,
                        width: double.infinity,
                        color: Color.fromRGBO(18, 19, 25, 1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Payment',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                          DropdownButtonPayment()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                          Obx(
                            () => Text(
                              _productsController.formatter.format(
                                  (producsController.sumPrice.toDouble()) +
                                      (producsController.sumPrice.toDouble() *
                                          0.1)),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(18, 19, 25, 1)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: Colors.deepOrange,
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.print, size: 16),
                                  SizedBox(width: 6),
                                  Text('Print Bills')
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: Colors.green,
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.payment, size: 16),
                                  SizedBox(width: 6),
                                  Text('Discharge')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
