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
                    alignment: Alignment(0, 0),
                    child: Container(
                      height: 100,
                      width: 300,
                      color: Colors.teal[300],
                      alignment: Alignment.center,
                      child: TextButton(
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
                      color: Color.fromARGB(255, 255, 0, 0),
                      alignment: Alignment.center,
                      child: TextButton(
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
                      color: Color.fromARGB(255, 255, 0, 0),
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
      drawer: Drawer(
        child: Container(
          color: Colors.blue[600],
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
                title: Text('Trackers'),
                onTap: () {
                  Navigator.pushNamed(context, "/trackers");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
