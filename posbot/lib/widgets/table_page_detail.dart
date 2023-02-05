import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class tablePageDetail extends StatelessWidget {
  final int name;
  final tap;
  tablePageDetail({required this.name, this.tap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: 220,
        height: 220,
        decoration: const BoxDecoration(
            color: Colors.amber,
            // shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Center(
            child: Text(
              'B${name}',
              style: const TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 50)
              )
        ),
      ),
    );
  }
}
