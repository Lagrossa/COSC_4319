import 'package:addvisor/Features/med_page/screens/med_AM.dart';
import 'package:addvisor/Features/med_page/screens/med_PM.dart';

import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';

import 'package:flutter/material.dart';

class medScreen extends StatelessWidget{

  //main page for medication. Simply direct to am or pm medication sections
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        backgroundColor: ThemeColors.background,
        title: Text('Meds'),
        centerTitle: true,
      ),
      drawer: DrawerNav(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(//am medication button
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, elevation: 0),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => medsAM())
                ),
                child: Text('AM', style: TextStyle(fontSize: 20,color: Colors.black),),
              ),
            ),
            const SizedBox(height: 70,),
            Container(//pm medication button
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, elevation: 0),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => medsPM())
                ),
                child: Text('PM', style: TextStyle(fontSize: 20,color: Colors.black),),

              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavBar(),
    );
  }
}