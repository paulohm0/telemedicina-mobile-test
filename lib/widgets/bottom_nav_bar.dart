import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 24,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.mode_comment_sharp,
              size: 24,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_active,
              size: 24,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_sharp,
              size: 24,
            ),
            label: ''),
      ],
    );
  }
}
