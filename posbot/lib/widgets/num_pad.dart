import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_numpad.dart';

class NumPad extends StatelessWidget {
  final String name;
  final tap;
  var _color = Color.fromRGBO(255, 255, 255, 1);
  NumPad({super.key, required this.name, this.tap});

  @override
  Widget build(BuildContext context) {
    final NumPadModel _numpad = Get.put(NumPadModel());
    if (name == 'DEL') {
      _color = Color.fromRGBO(225, 225, 225, 1) ;
    } else if (name == 'OK') {
      _color = Color.fromRGBO(225, 225, 225, 1) ;
    }
    return InkWell(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                  width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
            ),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(18, 19, 25, 1)),
              ),
            )),
      ),
    );
  }
}
