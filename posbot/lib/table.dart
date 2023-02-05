import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posbot/widgets/table_page_detail.dart';

import 'models/model_table.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TableModel _table = Get.put(TableModel());
    return Row(
      children: [
        SizedBox(
          width: 220,
          // height: 660,
          child: Expanded(
            child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 1),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: tablePageDetail(
                        name: _table.table_model[index],
                        tap: (){},
                      ));
                }),
          ),
        ),
        SizedBox(
          width: 676,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Container(
                  width: 676,
                  height: 424,
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      // shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 220,
                child: GridView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 16.0, bottom: 6.0),
                          child: tablePageDetail(
                            name: _table.table_model[index+3],
                            tap: (){},
                          ));
                    }),
              )
            ],
          ),
        ),
        SizedBox(
          width: 220,
          // height: 660,
          child: Expanded(
            child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 1),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: tablePageDetail(
                        name: _table.table_model[8 - index],
                        tap: (){},
                      ));
                }),
          ),
        ),
      ],
    );
  }
}
