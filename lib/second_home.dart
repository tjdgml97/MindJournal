import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalsh_project/second.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Second_Home extends StatefulWidget {
  const Second_Home({Key? key}) : super(key: key);

  @override
  State<Second_Home> createState() => _Second_HomeState();
}

class _Second_HomeState extends State<Second_Home> {

  final CollectionReference _mind =
  FirebaseFirestore.instance.collection('mind');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            semanticLabel: 'menu',
          ),
          onPressed: () async {
            Navigator.pushNamed(context,'/profile');
            // print('Menu button');
            // var data = {'name' : 'sh'};
            // // FirebaseFirestore.instance.collection('user').add(data).then((value) => print("save"));
            // FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).set({"name":"test"}).then((value) => print("save"));
            // print("click menubutton");
            // print(FirebaseAuth.instance.currentUser!.uid);
          },
        ),
        title: const Text('마음일지'),
        actions: <Widget>[

          // IconButton(
          //   icon: const Icon(
          //     Icons.create_sharp,
          //     semanticLabel: 'filter',
          //   ),
          //   onPressed: () {
          //     Navigator.pushNamed(context,'/add');
          //     //_update(documentSnapshot);
          //   },
          // ),
        ],
      ),
      body:  StreamBuilder(
      stream: _mind.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
      if(streamSnapshot.hasData) {
      return Column(
      children: [
      Expanded(
      child: SizedBox(
      height: 200,
      child:ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: streamSnapshot.data!.docs.length,
      itemBuilder: (BuildContext context, int index) {
      final DocumentSnapshot documentSnapshot =
      streamSnapshot.data!.docs[index];
   // if (index == 0) return Text("index=0");
      return Column(
      children:[
                                      Text(documentSnapshot['name']),
                                      Divider(height: 10,),
                                    ]
                                  );
                                }
                        ),
                    ),
                    ),
                  ],
                );
              }
              return Text("loading");
            }
      ),
    );
    //   child: ListView.builder(
    //     padding: const EdgeInsets.all(8),
    //     itemCount: streamSnapshot.data!.docs.length,
    //     itemBuilder: (BuildContext context, int index) {
    // if (index == 0) return HeaderTile();
    // return PersonTile(people[index-1]);
    // );

  }
}
