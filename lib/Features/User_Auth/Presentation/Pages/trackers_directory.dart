import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/habit_heat_map.dart';
import 'package:flutter/material.dart';

class TrackersDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(
            '              T R A C K E R S',
            textAlign: TextAlign.center,
          ),
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Color.fromARGB(255, 33, 243, 191),
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
                    color: Colors.white70,
                    alignment: Alignment(0, -1),
                    child: Container(
                      height: 100,
                      width: 300,
                      alignment: Alignment.center,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.teal)))),
                        child: Text(
                          'H A B I T S',
                          style: TextStyle(
                              color: Colors.white,
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
                    color: Colors.white70,
                    alignment: Alignment(0, 0),
                    child: Container(
                      height: 100,
                      width: 300,
                      alignment: Alignment.center,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 119, 248, 184)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 119, 248, 184))))),
                        child: Text(
                          'S Y M P T O M S',
                          style: TextStyle(
                              color: Colors.white,
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
                    color: Colors.white70,
                    alignment: Alignment(0, 0),
                    child: Container(
                      height: 100,
                      width: 300,
                      color: Color.fromARGB(255, 189, 124, 241),
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Text(
                          'M E D I C A T I O N',
                          style: TextStyle(
                              color: Colors.white,
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
      drawer: DrawerNav(),
    );
  }
}
