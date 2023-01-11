
import 'package:get/get.dart';

import '../constants/constant_app.dart';

class NumPadModel extends GetxController {
  RxList numpad_model = [
    //[number]
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "OK", "0", "DEL"
  ].obs;
  RxInt count_t = 0.obs;
  RxInt count_s = 0.obs;
  RxString tableString = ''.obs;
  RxString seatString = ''.obs;

  void addNumberToTable(String num){
    tableString.value += num;
    count_t.value = int.parse(tableString.toString());
    logger.i({"table:", count_t});
  }

  void addNumberToSeat(String num){
    seatString.value += num;
    count_s.value = int.parse(seatString.toString());
    logger.i({"table:", count_s});
  }

  void updateNewValue(){
    count_t.value = 0;
    count_s.value = 0;
    update();
  }
}

