// import 'package:flutter_pos_app/entity/order.dart';
// import 'package:get/get.dart';

// import '../constants/constant_app.dart';
// import '../entity/item.dart';

// class OrderController extends GetxController{
//   List<ProductItem> orderItems = <ProductItem>[].obs;
//   List<OrderItem> orderItems_c = <OrderItem>[];
//   int lastID = 0;

//   void copyItems(){
//      Map<OrderItem, ProductItem> orderItemsCopy = Map();
//      for(var i = 0; i < 5; i++) {
//        orderItemsCopy[orderItems_c[i]] = orderItems[i];
//        logger.i({"Copy": orderItemsCopy});
//      }
//   }

//   bool _checkItemInput(ProductItem orderItems){
//     if(orderItems.id == lastID){
//       return true;
//     }
//     else{
//       return false;
//     }
//   }

//   void addItemToOrder(ProductItem orderItems){
//     List<ProductItem> Temp = <ProductItem>[];
//     if(_checkItemInput(orderItems) == true){
//       logger.i({"True"});
//       // Temp
//       // return 
//     }
//     else{
//       logger.i({"False"});
//       // lastID = orderItems.id;
//       // return orderItems;
//     }
//   }

// }