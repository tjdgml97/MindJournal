import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Step2_Home extends StatefulWidget {
  const Step2_Home({Key? key}) : super(key: key);

  @override
  State<Step2_Home> createState() => _Step2_Home();
}

class _Step2_Home extends State<Step2_Home> {
  final CollectionReference _mind = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('step2');

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
            Navigator.pushNamed(context, '/profile');
          },
        ),
        title: const Text('감사연습일지'),
        actions: <Widget>[],
      ),
      body: StreamBuilder(
          stream: _mind.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return Container(
                color: Color(0xffECE6CC),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              // if (index == 0) return Text("index=0");
                              return Column(children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            documentSnapshot['name'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(documentSnapshot['createTime']
                                              .toDate()
                                              .toLocal()
                                              .toString()
                                              .substring(5, 16)),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          documentSnapshot.reference.delete();
                                        },
                                        icon: Icon(Icons.delete)),
                                  ],
                                ),
                                // Text(documentSnapshot['name']),
                                Divider(
                                  height: 10,
                                  color: Colors.black45,
                                ),
                              ]);
                            }),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Text("loading");
          }),
    );
  }
}
