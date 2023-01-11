import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posbot/models/model_numpad.dart';
import 'package:posbot/widgets/num_pad_pop.dart';

import 'num_pad.dart';

class topTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final String sideTitle;
  final Widget action;
  topTitle(
      {required this.title,
      required this.subTitle,
      required this.action,
      required this.sideTitle});
  @override
  Widget build(BuildContext context) {
    final NumPadModel _numpad = Get.put(NumPadModel());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (context) {
                    return NumPadScreen();
                  }),
              // => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NumPad())
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subTitle,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    sideTitle,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(flex: 1, child: Container(width: double.infinity)),
        Expanded(flex: 5, child: action),
      ],
    );
  }
}
