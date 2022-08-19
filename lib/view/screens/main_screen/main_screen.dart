import 'package:bitpay/view/screens/dashboard_page/dashboard_page.dart';
import 'package:bitpay/view/screens/scan_reciept_page/scan_reciept_page.dart';
import 'package:bitpay/view/screens/send_request_page/send_request_page.dart';
import 'package:bitpay/view/screens/settings_page/settings_page.dart';
import 'package:bitpay/view/screens/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final _pages = [
    DashboardPage(),
    ScanRecieptPage(),
    SendRequestPage(),
    SettingsPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),

      bottomNavigationBar: BottomNavBar(),
    );
  }
}
