import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

enum Screen { Login, Home, Tasks, Trackers, Meds }

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});
  static Screen currentScreen = Screen.Login;

  int GetIndexFromScreen(Screen screen) {
    switch (screen) {
      case Screen.Login:
        return 0;
      case Screen.Tasks:
        return 1;
      case Screen.Home:
        return 2;
      case Screen.Trackers:
        return 3;
      case Screen.Meds:
        return 4;
    }
  }

  Screen GetScreenFromIndex(int index) {
    switch (index) {
      case 0:
        return Screen.Login;
      case 1:
        return Screen.Tasks;
      case 2:
        return Screen.Home;
      case 3:
        return Screen.Trackers;
      case 4:
        return Screen.Meds;
      default:
        return Screen.Home;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: GNav(
          style: GnavStyle.google,
          gap: 8,
          backgroundColor: ThemeColors.background,
          activeColor: ThemeColors.button,
          color: ThemeColors.tertiary,
          padding: const EdgeInsets.all(16),
          tabBackgroundColor: const Color.fromARGB(255, 9, 42, 58),
          selectedIndex: GetIndexFromScreen(AppNavBar.currentScreen),
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
              case 4:
                Navigator.pushNamed(context, "/meds");
            }
            AppNavBar.currentScreen = GetScreenFromIndex(index);
          },
          tabs: const [
            GButton(icon: Icons.settings, text: "Settings"),
            GButton(icon: Icons.calendar_month, text: "Tasks"),
            GButton(icon: Icons.home, text: "Home"),
            GButton(icon: Icons.watch, text: "Trackers"),
            GButton(icon: Icons.medical_services_outlined, text: "Meds",),
          ],
        ),
      ),
    );
  }
}
