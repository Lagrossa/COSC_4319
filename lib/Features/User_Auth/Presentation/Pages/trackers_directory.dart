import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:addvisor/components/trackerboxes.dart';
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
            backgroundColor: const Color(0xFF111417),
            title: const Text(
              '              T R A C K E R S',
              textAlign: TextAlign.center,
              style: TextStyle(color: ThemeColors.white),
            ),
            expandedHeight: 75,
            pinned: true,
            shadowColor: ThemeColors.secondary,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                color: const Color(0xFF111417),
              ),
            ),
          ),
          // HABIT TRACKER
          TrackerBox(path: "/habits", name: 'H A B I T S'),
          // SYMPTOM TRACKER
          TrackerBox(path: "/habits", name: 'S Y M P T O M S'),
          //MEDICATION TRACKER
          TrackerBox(path: "/habits", name: 'M E D I C A T I O N'),
        ]),
      ),
      drawer: const DrawerNav(),
      bottomNavigationBar: const AppNavBar(),
    );
  }
}
