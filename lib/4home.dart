import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalsh_project/second.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Step4_Home extends StatefulWidget {
  const Step4_Home({Key? key}) : super(key: key);

  @override
  State<Step4_Home> createState() => _Step4_Home();
}

class _Step4_Home extends State<Step4_Home> {

  final CollectionReference _mind =
  FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).collection('step4');

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
        title: const Text('죄책감 대처하기 연습일지'),
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
              return Container(
                color: Color(0xffECE6CC),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
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

                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [
                                              Text(documentSnapshot['name'],style: TextStyle(fontSize: 18),),
                                              Text(documentSnapshot['createTime'].toDate().toLocal().toString().substring(5,16)),

                                            ],
                                          ),),
                                        // ListTile(
                                        //   title:    Text(documentSnapshot['name'],style: TextStyle(fontSize: 18),),
                                        //   subtitle: Text(documentSnapshot['createTime'].toDate().toLocal().toString().substring(5,16)),
                                        // ),
                                        IconButton(onPressed: (){
                                          documentSnapshot.reference.delete();
                                    }, icon: Icon(Icons.delete)),                                      ],
                                    ),
                                    // Text(documentSnapshot['name']),
                                    Divider(height: 10,color: Colors.black45,),
                                  ]
                              );
                            }
                        ),
                      ),
                    ),
                  ],
                ),
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
