import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posbot/widgets/num_pad_box.dart';
import 'package:posbot/widgets/table_frame.dart';

import '../constants/constant_app.dart';
import '../models/model_numpad.dart';
import '../models/model_table.dart';
import 'num_pad.dart';

class NumPadScreen extends StatefulWidget {
  NumPadScreen({super.key});

  @override
  State<NumPadScreen> createState() => _NumPadScreenState();
}

class _NumPadScreenState extends State<NumPadScreen> {
  final NumPadModel _numpad = Get.put(NumPadModel());
  final TableModel _table = Get.put(TableModel());
  String _flag = '';

  var color = Colors.deepOrangeAccent[100];

  var selected;

  bool _active = false;

  void switchBox(String flag, String content) {
    setState(() {
      if (flag == 'table' && content != 'DEL' && content != 'OK') {
        _numpad.addNumberToTable(content);
      } else if (flag == 'seat' && content != 'DEL' && content != 'OK') {
        _numpad.addNumberToSeat(content);
      }
      if (content == 'DEL') {
        _table.updateNewValue();
        _numpad.updateNewValue();
      }
      // logger.i({"test:", content});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: _active,
                child: const tableFrame()),
            SizedBox(
              height: 570,
              width: 370,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                InkWell(
                  onTap: () => Navigator.pop(context, 'Close'),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 39.0, bottom: 8),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Obx(
                      () => NumPadBox(
                        name:
                            'Table: ${_table.table_number | _numpad.count_t.toInt()}',
                        color:
                            (selected != 1) ? Color.fromRGBO(225, 225, 225, 1) : Color.fromRGBO(195, 195, 195, 1),
                        index: 1,
                        tap: () {
                          _flag = 'table';
                          setState(() {
                            selected = 1;
                            _active = true;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 6),
                    NumPadBox(
                      name: 'Seat: ${_numpad.count_s}',
                      color: (selected != 2) ? Color.fromRGBO(225, 225, 225, 1) : Color.fromRGBO(195, 195, 195, 1),
                      index: 2,
                      tap: () {
                        _flag = 'seat';
                        setState(() {
                          selected = 2;
                        });
                      },
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: SizedBox(
                    width: 300,
                    height: 420,
                    child: Obx(
                      () => GridView.builder(
                          primary: false,
                          itemCount: _numpad.numpad_model.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 1),
                          itemBuilder: (context, index) {
                            return NumPad(
                                name: '${_numpad.numpad_model[index]}',
                                tap: () {
                                  if (_flag != null) {
                                    switchBox(
                                        _flag, _numpad.numpad_model[index]);
                                  }
                                });
                          }),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
