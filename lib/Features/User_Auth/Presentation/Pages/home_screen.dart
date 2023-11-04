import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/habit_heat_map.dart';
import 'package:addvisor/components/homeBoxes.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.darkGrey,
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: ThemeColors.darkGrey,
        ),
        drawer: DrawerNav(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: ThemeColors.grey),
                child: Column(
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
                              style: TextStyle(
                                  fontSize: 40, color: ThemeColors.salmon),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "M O N T H L Y  S U M M A R Y",
                  style: TextStyle(color: ThemeColors.white, fontSize: 20),
                ),
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
                      decoration: const BoxDecoration(
                          color: ThemeColors.grey,
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
