import 'package:flutter/material.dart';

import 'history_table.dart';

class hisDay extends StatelessWidget {
  final String dateTime;

  const hisDay({required this.dateTime});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dateTime,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(18, 19, 25, 1),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: hisTable(id: 1, total: '100000'),
                    );
                    // return hisTable(
                    //   id: 1,
                    //   total: '10000000',
                    // );
                  }),
            )
          ],
        ));
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(
    //       dateTime,
    //     ),
    //     const SizedBox(height: 10),
    //     ListView.builder(
    //       itemCount: 1,
    //       itemBuilder: (context, index) {
    //         return hisTable(
    //           id: 1,
    //           total: '10000000',
    //         );
    //       }
    //     )
    //   ],
    // );
  }
}
