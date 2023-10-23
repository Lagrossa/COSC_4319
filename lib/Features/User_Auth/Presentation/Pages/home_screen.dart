import 'package:addvisor/Features/User_Auth/Presentation/Pages/tracker_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[600],
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'A D D V I S O R',
                    style: TextStyle(
                        fontSize: 30, fontFamily: 'Arial', color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Screen'),
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
              ),
              ListTile(
                leading: Icon(Icons.checklist_sharp),
                title: Text('Tasks'),
                onTap: () {
                  Navigator.pushNamed(context, "/tasks");
                },
              ),
              ListTile(
                leading: Icon(Icons.medical_services_outlined),
                title: Text('Medication'),
              ),
              ListTile(
                leading: Icon(Icons.event_repeat),
                title: Text('Habits'),
                onTap: () {
                  Navigator.pushNamed(context, "/trackers");
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Welcome",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          )),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
            },
            child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.black,
            activeColor: Colors.blue,
            color: Colors.white,
            padding: EdgeInsets.all(16),
            tabBackgroundColor: Color.fromARGB(255, 31, 30, 30),
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
      ),
    );
  }
}
