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
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white,),
              title: Text('Home', style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pushNamed(context, "/home");
                AppNavBar.currentScreen = Screen.Home;
              },
            ),
            ListTile(
              leading: Icon(Icons.checklist_sharp, color: Colors.white,),
              title: Text('Tasks', style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pushNamed(context, "/tasks");
                AppNavBar.currentScreen = Screen.Tasks;
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services_outlined, color: Colors.white,),
              title: Text('Medication', style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pushNamed(context, "/meds");
                AppNavBar.currentScreen = Screen.Tasks;
              },
            ),
            ListTile(
              leading: Icon(Icons.event_repeat, color: Colors.white,),
              title: Text('Trackers', style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pushNamed(context, "/trackers");
                AppNavBar.currentScreen = Screen.Trackers;
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.white,),
              title: Text('Sign Out', style: TextStyle(color: Colors.white),),
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
