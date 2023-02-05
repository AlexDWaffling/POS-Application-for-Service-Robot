import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemModelBar extends ChangeNotifier{
  final List _main_items_bar = [
    //[name, icon]
    ["Home",Icons.rocket_sharp],
    ["Table",Icons.table_restaurant],
    ["Payment",Icons.payment],
    ["History",Icons.history_toggle_off_rounded], 
    ["Settings",Icons.sports_soccer_outlined],
  ];
  get main_items_bar => _main_items_bar;
}