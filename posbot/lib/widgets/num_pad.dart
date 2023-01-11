import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_numpad.dart';

class NumPad extends StatelessWidget {
  final String name;
  final tap;
  var _color = Color.fromARGB(255, 135, 194, 188);
  NumPad({super.key, required this.name, this.tap});

  @override
  Widget build(BuildContext context) {
    final NumPadModel _numpad = Get.put(NumPadModel());
    if (name == 'DEL'){
      _color = Colors.redAccent;
    } else if(name == 'OK'){
      _color = Colors.green;
    }
    return InkWell(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
            decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            )),
      ),
    );
  }
}
