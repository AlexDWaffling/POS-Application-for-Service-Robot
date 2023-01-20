import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_numpad.dart';

class tableDetail extends StatefulWidget {
  final String name;
  final tap;
  final click;
  tableDetail({super.key, required this.name, this.tap, this.click});

  @override
  State<tableDetail> createState() => _tableDetailState();
}

class _tableDetailState extends State<tableDetail> {
  var _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: widget.tap,
      onTap: widget.click,
      child: Container(
        // height: 30,
        // width: 30,
        decoration: BoxDecoration(
            color: _color,
            // shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Center(
          child: Text(
            widget.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
