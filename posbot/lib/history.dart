import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posbot/widgets/table_page_detail.dart';

import 'models/model_table.dart';
import 'widgets/history_day.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: double.infinity,
            width: 300,
            color: Colors.amber,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Container(
                          // height: 100,
                          width: double.infinity,
                          // color: Colors.red,
                          child: hisDay(dateTime: '12/02/2023')),
                    ),
                  );
                })),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: double.infinity,
          width: 1,
          color: Colors.red,
        ),
        Expanded(
            child: Container(
          height: double.infinity,
          width: 300,
          color: Colors.cyan,
        )),
      ],
    );
  }
}
