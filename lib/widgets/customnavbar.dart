import 'package:flutter/material.dart';
import 'package:electric_invoice/styles/colors.dart';
class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    Key? key,
    required this.onTap,
    required this.selecteditem,
  }) : super(key: key);
  final Function(int) onTap;
  final int selecteditem;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 20,
      onTap:onTap,
      currentIndex: selecteditem,
      selectedItemColor: kColorBlue,
      unselectedItemColor: kColorGrey,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage('images/home.png')
          ),
          label: 'DashBoard',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage('images/home.png')
          ),
          label: 'B',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage('images/home.png')
          ),
          label: 'C',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage('images/home.png')
          ),
          label: 'D',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage('images/home.png')
          ),
          label: 'E',
        ),
      ],
    );
  }
}
