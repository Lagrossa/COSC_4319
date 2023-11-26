import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:addvisor/components/themeColors.dart';

class medsPM extends StatefulWidget{
  const medsPM({Key? key}) : super(key: key);

  @override
  State<medsPM> createState() => medsPMState();
}
class medsPMState extends State<medsPM>{
  late User currUser;
  late DatabaseReference dbRef;
  late Query dbQuery;
  late TextEditingController medNameController;
  String medicationName = '';

  @override
  void initState(){
    currUser = FirebaseAuth.instance.currentUser!;
    dbRef = FirebaseDatabase.instance.ref().child(currUser.uid).child('Meds').child('PM');
    dbQuery = FirebaseDatabase.instance.ref().child(currUser.uid).child('Meds').child('PM');
    medNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    medNameController.dispose();
    super.dispose();
  }

  Widget listMeds({required Map medList}){
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 100,
      color: Colors.purple[700],
      child: Column(
        children: [
          Row(
            children: [
              Text(
                medList['MedName'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  dbRef.child(medList['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 270,),
              Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.deepPurple,
                value: medList['Taken'],
                onChanged: (bool? boxValue) {
                  dbRef.child(medList['key']).child('Taken').set(boxValue!);
                },
                side: BorderSide(
                  color: Colors.white,
                ),
              ),
            ],
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
        title: Text('PM Medications', style: TextStyle(color: Colors.purple),),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbQuery,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
            Map medList = snapshot.value as Map;
            medList['key'] = snapshot.key;
            return listMeds(medList: medList);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.purple[700],
        onPressed: () async{
          final medName = await addMed();
          if(medName == null || medName.isEmpty) return;

          final addedMed = <String, dynamic>{
            'MedName' : medName,
            'Taken' : false,
          };
          dbRef.push().set(addedMed);
        },
      ),
    );
  }
  Future<String?> addMed() => showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.purple[200],
      title: Text('Add medication'),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Enter medication',
        ),
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