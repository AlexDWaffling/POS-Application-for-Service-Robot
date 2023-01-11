import 'dart:convert';
import 'dart:ffi';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:posbot/constants/controllers.dart';
import 'package:posbot/entity/order.dart';
import 'package:posbot/home.dart';

import '../constants/constant_app.dart';
import '../database/database.dart';
import '../entity/item.dart';

class ProductsController extends GetxController {
  static ProductsController instance = Get.find();
  late AppDatabase appDatabase;
  RxList<ProductItem> products = RxList<ProductItem>([]);
  RxList<ProductItem> orderItems = <ProductItem>[].obs;
  RxDouble sumPrice = 0.0.obs;

  var formatter = NumberFormat('#,###,##0');

  @override
  void onInit() {
    appDatabase = Get.find();
    //  deleteAllItem();
    addDatafrJson();
    loadData();
    //loadData();
    //printInfo(printFunction: loadData);
    // for (var element in products) {
    //   logger.i({"Products": element.toString()});
    // }
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  void summaryItemPrice(double item){
      sumPrice.value += item;
    logger.i({"Summary": sumPrice});
  }
  void addItemOrder(ProductItem item) {
    if (_checkOrderItem(item)) {
      for (var i in orderItems) {
        if (i.id == item.id) {
          i.count++;
          summaryItemPrice(item.price);
          orderItems.add(item);
          orderItems.removeLast();
        }
      }
    } else {
      orderItems.add(item);
      summaryItemPrice(item.price);
    }
  }

  bool _checkOrderItem(ProductItem item) {
    bool flag = false;
    for (var i in orderItems) {
      if (i.id == item.id) {
        flag = true;
        return flag;
      }
    }
    return flag;
  }

  RxList<ProductItem> getAllItemsByCategory(String category) {
    Future<List<ProductItem>> productItemByCtg =
        appDatabase.itemDAO.getAllItemsByCategory(category);
    RxList<ProductItem> itemsCtg = RxList<ProductItem>([]);
    productItemByCtg.then((value) => itemsCtg.addAll(value));
    return itemsCtg;
  }

  void loadData() {
    appDatabase.itemDAO.getAllItems().then((value) => products.addAll(value));
    //products.bindStream(appDatabase.itemDAO.getAllItems().asStream());
    logger.i({"Products": products.length});
  }

  void addDatafrJson() {
    //final List<ProductItem> items = [];
    readJsonDatabase().then((value) {
      for (ProductItem item in value) {
        appDatabase.itemDAO.insertItem(item);
        logger.i({"Items": item.toString()});
      }
      //items.addAll(value);
    });
    //logger.i({"Item11": items.length});
  }

  Future<List<ProductItem>> readJsonDatabase() async {
    final rawData =
        await rootBundle.rootBundle.loadString('assets/data/virtual_item.json');
    logger.i({"rawData": rawData.toString()});
    List<dynamic> list = jsonDecode(rawData);
    List<ProductItem> pItem = List<ProductItem>.from(
        list.map<ProductItem>((model) => ProductItem.fromJson(model)));
    // for (var item in pItem) {
    //   logger.i({"list": item.toString()});
    // }

    return pItem;
  }

  void deleteAllItem() {
    appDatabase.itemDAO.deleteAllItem();
  }
}
