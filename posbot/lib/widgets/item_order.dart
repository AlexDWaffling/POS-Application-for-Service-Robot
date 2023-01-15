import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:posbot/constants/constant_app.dart';
import 'package:posbot/constants/controllers.dart';
import 'package:posbot/entity/item.dart';

import '../controllers/productController.dart';

class itemOrder extends StatelessWidget {
  final String image;
  final String title;
  final String qty;
  final String price;
  final dismiss;
  final counter_plus;
  final counter_minus;
  itemOrder(
      {required this.image,
      required this.title,
      required this.qty,
      required this.price,
      this.dismiss,
      this.counter_plus,
      this.counter_minus,
      });

  final ProductsController _productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.5,
          children: [
            SlidableAction(
              backgroundColor: Colors.green,
              borderRadius: BorderRadius.circular(12),
              icon: Icons.add,
              onPressed: counter_plus
              // (context){
                
              // },
            ),
            SlidableAction(
              backgroundColor: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              icon: Icons.remove,
              onPressed: counter_minus
              // (context){
                // setState(() {
                //   _productsController.dismissed_count.value++;
                //   logger.i("count:", _productsController.dismissed_count);
                // });
              // },
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.35,
          dismissible: DismissiblePane(onDismissed: dismiss),
          children: [
            SlidableAction(
              label: 'Delete',
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
              icon: Icons.delete,
              onPressed: (context) {},
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          // margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xff1f2029),
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'x $qty',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
