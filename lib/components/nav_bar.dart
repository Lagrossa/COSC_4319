import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});
  static int index = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.darkGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: GNav(
          gap: 8,
          backgroundColor: ThemeColors.darkGrey,
          activeColor: ThemeColors.red,
          color: ThemeColors.grey,
          padding: EdgeInsets.all(16),
          tabBackgroundColor: const Color.fromARGB(255, 37, 38, 56),
          selectedIndex: AppNavBar.index,
          onTabChange: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(
                    context, "/login"); //Change to settings when added
                break;
              case 1:
                Navigator.pushNamed(context, "/tasks");
                break;
              case 2:
                Navigator.pushNamed(context, "/home");
                break;
              case 3:
                Navigator.pushNamed(context, "/trackers");
                break;
            }
            AppNavBar.index = index;
          },
          tabs: [
            GButton(icon: Icons.settings, text: "Settings"),
            GButton(icon: Icons.calendar_month, text: "Tasks"),
            GButton(icon: Icons.home, text: "Home"),
            GButton(icon: Icons.watch, text: "Trackers"),
          ],
        ),
      ),
    );
  }
}
