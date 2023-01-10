import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalsh_project/second.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Step3_Home extends StatefulWidget {
  const Step3_Home({Key? key}) : super(key: key);

  @override
  State<Step3_Home> createState() => _Step3_Home();
}

class _Step3_Home extends State<Step3_Home> {

  final CollectionReference _mind =
  FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).collection('step3');

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

          },
        ),
        title: const Text('남긴것들 기억하기 연습일지'),
        actions: <Widget>[


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

                                    AspectRatio(
                                      aspectRatio: 18 / 8.5,
                                      child: Image.network(
                                        documentSnapshot!['photo'],
                                        // widget.docid['photo'],
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),

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
