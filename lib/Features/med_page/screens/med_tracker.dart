import 'package:addvisor/Features/med_page/screens/med_AM.dart';
import 'package:addvisor/Features/med_page/screens/med_PM.dart';

import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class medScreen extends StatefulWidget{
  const medScreen({Key? key}) : super(key: key);
  @override
  medScreenState createState() => medScreenState();
}

class medScreenState extends State<medScreen>{
  late DatabaseReference dbRef;
  late User currUser;
  late Query dbQueryAM;
  late Query dbQueryPM;
  late TextEditingController medNameController;
  String medicationName = '';

  @override
  void initState(){
    currUser = FirebaseAuth.instance.currentUser!;
    dbRef = FirebaseDatabase.instance.ref().child(currUser.uid).child('Meds');
    dbQueryAM = FirebaseDatabase.instance.ref().child(currUser.uid).child('Meds').child('AM');
    dbQueryPM = FirebaseDatabase.instance.ref().child(currUser.uid).child('Meds').child('PM');
    medNameController = TextEditingController();
    super.initState();
  }
  @override
  void dispose(){
    medNameController.dispose();
    super.dispose();
  }

  Widget listMeds({required Map medList, required Color backColor}){
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 60,
      color: backColor,
      child: Row(
        children: [
          Text(
            medList['MedName'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ],
      ),
    );
  }
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
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => medsAM())
                ),
                child: Text('AM', style: TextStyle(fontSize: 20,color: Colors.black),),
              ),
            ),
            const SizedBox(height: 70,),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => medsPM())
                ),
                child: Text('PM', style: TextStyle(fontSize: 20,color: Colors.black),),

              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.blue,
        onPressed: () {
          final addedMed = <String, dynamic>{
            'MedName' : 'methylphenidate',
            'Taken' : false,
          };
          dbRef.child('AM').push().set(addedMed);
          dbRef.child('PM').push().set(addedMed);
        },
      ),
    );
  }
/*
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
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 25,
                    color: Colors.orange,
                    child: Text('AM', style: TextStyle(fontSize: 20,color: Colors.black),),
                  ),
                ),
                Container(
                  height: 25,
                  color: Colors.orange,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: Icon(Icons.add, color: Colors.black,),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              child: FirebaseAnimatedList(
                query: dbQueryAM,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                  Map AMList = snapshot.value as Map;
                  AMList['key'] = snapshot.key;
                  return listMeds(medList: AMList, backColor: Colors.orange);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.blue,
        onPressed: () {
          final addedMed = <String, dynamic>{
            'MedName' : 'methylphenidate',
            'Taken' : false,
          };
          dbRef.child('AM').push().set(addedMed);
          dbRef.child('PM').push().set(addedMed);
        },
      ),
    );
  }
*/
  Future<String?> addMed() => showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Add medication'),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(hintText: 'Enter medication'),
        controller: medNameController,
        onSubmitted: (_) {
          Navigator.of(context).pop(medNameController.text);
          medNameController.clear();
        },
      ),
      actions: [
        TextButton(
          child: Text('Submit'),
          onPressed: () {
            Navigator.of(context).pop(medNameController.text);
            medNameController.clear();
          },
        ),
      ],
    ),
  );
}