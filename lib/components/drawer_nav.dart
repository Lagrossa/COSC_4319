import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ThemeColors.background,
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 100,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, "/home");
                AppNavBar.currentScreen = Screen.Home;
              },
            ),
            ListTile(
              leading: Icon(Icons.checklist_sharp),
              title: Text('Tasks'),
              onTap: () {
                Navigator.pushNamed(context, "/tasks");
                AppNavBar.currentScreen = Screen.Tasks;
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services_outlined),
              title: Text('Medication'),
            ),
            ListTile(
              leading: Icon(Icons.event_repeat),
              title: Text('Trackers'),
              onTap: () {
                Navigator.pushNamed(context, "/trackers");
                AppNavBar.currentScreen = Screen.Trackers;
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
                AppNavBar.currentScreen = Screen.Login;
              },
            ),
          ],
        ),
      ),
    );
  }
}
