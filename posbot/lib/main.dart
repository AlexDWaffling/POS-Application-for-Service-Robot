import 'dart:io';

import 'package:flutter/material.dart';
import 'package:posbot/payment.dart';
import 'package:posbot/widgets/num_pad.dart';

import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'database/database.dart';
import 'entity/order.dart';
import 'history.dart';
import 'home.dart';
import 'table.dart';
import 'models/model_bar.dart';
import 'models/model_tab.dart';
import 'widgets/item_bar.dart';
import 'widgets/logo_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // static Future<AppDatabase> init() async {
  //   AppDatabase instance = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //   return instance;
  // }
  await Get.putAsync<AppDatabase>(() async {
    final instance =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return instance;
  });
  // WidgetsFlutterBinding.ensureInitialized();
  // await windowManager.ensureInitialized();
  // if (Platform.isLinux) {
  //   WindowManager.instance.setMinimumSize(const Size(1024, 600));
  //   WindowManager.instance.setMaximumSize(const Size(1024, 600));
  // }
  runApp(const MyApp());
  final List<OrderItem> list = [];
}

// initServices() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Get.putAsync<AppDatabase>(() => AppDatabase.init());
// }

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemModelBar()),
        ChangeNotifierProvider(create: (context) => ItemModelTab()),
      ],
      child: const MaterialApp(
        home: MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String pageActive = 'Home';

  _pageView() {
    switch (pageActive) {
      case 'Home':
        return const HomePage();
      case 'Table':
        return const TablePage();
      case 'Payment':
        return const PaymentPage();
      case 'History':
        return const HistoryPage();
      case 'Settings':
        return Container();

      default:
        return const HomePage();
    }
  }

  _setPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 240, 240, 240),
      body: Row(
        children: [
          Container(
              width: 70,
              padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
              height: MediaQuery.of(context).size.height,
              // child: sideBar(),
              child: Consumer<ItemModelBar>(builder: (context, value, child) {
                return Column(children: [
                  logoBar(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.main_items_bar.length,
                        itemBuilder: (context, index) {
                          return itemBar(
                            menu: value.main_items_bar[index][0],
                            icon: value.main_items_bar[index][1],
                            tap_state: () =>
                                _setPage(value.main_items_bar[index][0]),
                          );
                        }),
                  )
                ]);
              })),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24, right: 12),
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                border: Border.all(
                    width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
                color: Color.fromRGBO(249, 249, 249, 1),
              ),
              child: _pageView(),
            ),
          ),
        ],
      ),
    );
  }
}
