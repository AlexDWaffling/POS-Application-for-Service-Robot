import 'package:flutter/material.dart';

const List<String> list = <String>['Cast', 'Momo', 'VNPay', 'Free', ''];

class DropdownButtonPayment extends StatefulWidget {
  const DropdownButtonPayment({super.key});

  @override
  State<DropdownButtonPayment> createState() => _DropdownButtonPaymentState();
}

class _DropdownButtonPaymentState extends State<DropdownButtonPayment> {
  String dropdownValue = list.last;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromRGBO(18, 19, 25, 1)),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
