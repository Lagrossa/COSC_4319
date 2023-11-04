import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/habit_heat_map.dart';
import 'package:addvisor/components/homeBoxes.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.grey,
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: ThemeColors.grey,
        ),
        drawer: DrawerNav(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50, width: 50),
              const Padding(
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text("Monthly Summary"),
              ),
              const SizedBox(height: 15, width: 15),
              Column(
                children: [
                  SizedBox(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return HomeBoxes(index: index);
                        }),
                  ),
                  SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                          color: ThemeColors.ivory,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: HabitHeatMap(),
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppNavBar());
  }
}
