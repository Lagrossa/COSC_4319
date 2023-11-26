import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';

class TrackersDirectory extends StatelessWidget {
  const TrackersDirectory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: ThemeColors.background,
            title: const Text(
              '              T R A C K E R S',
              textAlign: TextAlign.center,
            ),
            expandedHeight: 100,
            pinned: true,
            shadowColor: ThemeColors.secondary,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                color: ThemeColors.secondary,
              ),
            ),
          ),
          // HABIT TRACKER
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(children: [
                  Container(
                      height: 400,
                      color: ThemeColors.secondary,
                      alignment: const Alignment(0, -1),
                      child: Container(
                        height: 100,
                        width: 300,
                        alignment: Alignment.center,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(ThemeColors.button),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: ThemeColors.button)))),
                          child: const Text(
                            'H A B I T S',
                            style: TextStyle(
                                color: ThemeColors.white,
                                fontSize: 60,
                                fontFamily: 'Roboto'),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/habits");
                          },
                        ),
                      )),
                ]),
              ),
            ),
          ),
          // SYMPTOM TRACKER
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(children: [
                  Container(
                      height: 400,
                      color: ThemeColors.secondary,
                      alignment: const Alignment(0, 0),
                      child: Container(
                        height: 100,
                        width: 300,
                        alignment: Alignment.center,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ThemeColors.secondary),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: ThemeColors.secondary)))),
                          child: const Text(
                            'S Y M P T O M S',
                            style: TextStyle(
                                color: ThemeColors.white,
                                fontSize: 35,
                                fontFamily: 'Roboto'),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, "/habits");
                          },
                        ),
                      )),
                ]),
              ),
            ),
          ),
          //MEDICATION TRACKER
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(children: [
                  Container(
                      height: 400,
                      color: ThemeColors.secondary,
                      alignment: const Alignment(0, 0),
                      child: Container(
                        height: 100,
                        width: 300,
                        color: ThemeColors.button,
                        alignment: Alignment.center,
                        child: TextButton(
                          child: const Text(
                            'M E D I C A T I O N',
                            style: TextStyle(
                                color: ThemeColors.white,
                                fontSize: 30,
                                fontFamily: 'Roboto'),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, "/habits");
                          },
                        ),
                      )),
                ]),
              ),
            ),
          ),
        ]),
      ),
      drawer: const DrawerNav(),
      bottomNavigationBar: const AppNavBar(),
    );
  }
}
