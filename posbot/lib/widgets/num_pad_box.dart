import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant_app.dart';
import '../models/model_numpad.dart';
import 'num_pad.dart';

class NumPadBox extends StatelessWidget {
  final String name;
  // ignore: prefer_typing_uninitialized_variables
  final tap;
  // ignore: prefer_typing_uninitialized_variables
  var color;

  final int index;
  
  NumPadBox({super.key, required this.name, this.color, required this.index, this.tap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: 
      Container(
        width: 143,
        height: 70,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // borderSide: BorderSide(color: color),
    );
  }
}
