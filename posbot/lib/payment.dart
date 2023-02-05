import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posbot/widgets/table_page_detail.dart';

import 'models/model_table.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.amber,
        child: Text(
          'QR code of payment method',
          style: TextStyle(color: Colors.black, fontSize: 50),
        )
      ),
    );
  }
}
