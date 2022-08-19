import 'package:bitpay/view/constants/colors.dart';
import 'package:flutter/material.dart';

//bottom nav selection change
ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: newIndex,
              onTap: (index) {
                indexChangeNotifier.value = index;
              },
              backgroundColor: bottomNavBg,
              selectedItemColor: bottomNavSelectedColor,
              unselectedItemColor: bottomNavUnSelectedColor,
              selectedIconTheme: IconThemeData(
                color: bottomNavSelectedColor,
              ),
              unselectedIconTheme: IconThemeData(color: bottomNavUnSelectedColor),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.dashboard,
                    ),
                    label: 'Dashboard'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.qr_code_scanner,
                    ),
                    label: 'Scan Receipt'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.payments_rounded), label: 'Send & Request'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle,
                    ),
                    label: 'Settings'),
              ]);
        });
  }
  }

