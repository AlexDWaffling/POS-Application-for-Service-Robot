import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_numpad.dart';

class tableDetail extends StatelessWidget {
  final String name;
  final tap;
  tableDetail({super.key, required this.name, this.tap});
  var _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: tap,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(color: _color, shape: BoxShape.circle),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
