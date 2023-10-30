import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/habit_heat_map.dart';
import 'package:addvisor/components/homeBoxes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: DrawerNav(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50, width: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home,"),
                  Text(
                    "USERNAME",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text("Monthly Summary"),
            ),
            SizedBox(height: 15, width: 15),
            Expanded(
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return HomeBoxes(index: index);
                    })),
            //Container(height: 300, width: 300, child: HabitHeatMap()),
          ],
        ),
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
