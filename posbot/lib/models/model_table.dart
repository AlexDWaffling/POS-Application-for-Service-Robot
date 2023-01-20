import 'package:get/get.dart';

import '../constants/constant_app.dart';

class TableModel extends GetxController {
  RxList table_model = [
    //[number]
    1, 2, 3, 4, 5, 6, 7, 8, 9
  ].obs;
  RxList test_order = [
    ["Fish and haha", true],
    ["Fish and dog", true],
    ["Fish and cat", false],
    ["Fish and hihi", false],
  ].obs;
  RxInt table_number = 0.obs;
  RxInt table_number_detail = 0.obs;
  // ignore: non_constant_identifier_names
  void None() {
    logger.i({"table num:", table_number});
  }

  void updateNewValue(){
    table_number.value = 0;
    update();
}
}
