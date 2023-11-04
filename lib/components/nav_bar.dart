import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.darkGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: GNav(
          gap: 8,
          backgroundColor: ThemeColors.darkGrey,
          activeColor: ThemeColors.white,
          color: ThemeColors.grey,
          padding: EdgeInsets.all(16),
          tabBackgroundColor: const Color.fromARGB(255, 36, 39, 41),
          selectedIndex: 2,
          onTabChange: (index) {
            switch (index) {
              case 0:
                //settings code
                break;
              case 1:
                Navigator.pushNamed(context, "/tasks");
                break;
              case 2:
                //Nothing..?
                break;
              case 3:
                Navigator.pushNamed(context, "/trackers");
            }
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
