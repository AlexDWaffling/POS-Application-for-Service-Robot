import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posbot/widgets/table_detail.dart';

import '../models/model_table.dart';
import 'table_frame_info.dart';

class tableFrame extends StatefulWidget {
  const tableFrame({super.key});

  @override
  State<tableFrame> createState() => _tableFrameState();
}

class _tableFrameState extends State<tableFrame> {
  final TableModel _table = Get.put(TableModel());
  bool _active = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        height: 460,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: _active,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 22, right: 22, bottom: 10),
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 45.0),
                          child: Text(
                            'B${_table.table_number_detail}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 25),
                        // Expanded(
                        // child:
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Order List',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: 100),
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 280,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Expanded(
                                  child: Obx(() => ListView.builder(
                                        itemCount: _table.test_order.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return tableFrameInfo(
                                            name: _table.test_order[index][0],
                                            status: _table.test_order[index][1],
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        // ),
                        // Expanded(
                        //   child: Text(
                        //     'Status',
                        //     style: const TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         fontStyle: FontStyle.italic,
                        //         fontSize: 20,
                        //         color: Colors.white),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => GridView.builder(
                      itemCount: _table.table_model.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 1), //1.25
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: tableDetail(
                                name: 'B${_table.table_model[index]}',
                                tap: () {
                                  setState(() {
                                    _table.table_number.value =
                                        _table.table_model[index];
                                    _table.None();
                                  });
                                },
                                click: () {
                                  setState(() {
                                    _table.table_number_detail.value =
                                        _table.table_model[index];
                                    _active = true;
                                  });
                                }));
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
