import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posbot/widgets/table_detail.dart';

import '../models/model_numpad.dart';
import '../models/model_table.dart';


class tableFrame extends StatefulWidget {
  const tableFrame({super.key});

  @override
  State<tableFrame> createState() => _tableFrameState();
}

class _tableFrameState extends State<tableFrame> {
  @override
  Widget build(BuildContext context) {
    final TableModel _table = Get.put(TableModel());
    return SizedBox(
        width: 500,
        height: 420,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
          child: Obx(() => GridView.builder(
                itemCount: _table.table_model.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1.25),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(22.0),
                    child: tableDetail(
                      name: 'B${_table.table_model[index]}',
                      tap: (){
                        setState(() {
                          _table.table_number.value = _table.table_model[index];
                          _table.None();
                        });
                      },
                    )
                  );
                }),
          ),
        ));
  }
}
