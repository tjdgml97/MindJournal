import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'app.dart';
import 'home.dart';

class Step4Page extends StatefulWidget {
  const Step4Page({Key? key}) : super(key: key);

  @override
  State<Step4Page> createState() => _Step4PageState();
}

class _Step4PageState extends State<Step4Page> {
  final CollectionReference _mind = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('step4');

  late String photoUrl = "";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String name = _nameController.text;
    return Scaffold(
      backgroundColor: Color(0xffECE6CC),
      primary: true,
      appBar: AppBar(
        title: Text('Challenge'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 650,
            // color: Color(0xffECE6CC),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xffECE6CC),
              border: Border.all(color: Colors.black),
            ),
            // color:  Color(0xffECE6CC),
            child: Center(
                child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  " Step 4 ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "???????????? ?????? ???????????? ",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                AspectRatio(
                  aspectRatio: 8 / 2,
                  child: Image.network(
                    'https://cdn1.iconfinder.com/data/icons/actions-15/504/hug-care-love-comfort-support-1024.png',
                    // widget.docid['photo'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 9,
                  thickness: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                    "?????? ???????????? ??????????????? ?????? ????????? ????????? ?????? ???????????? ???????????????, ???????????? ????????? ????????? ????????? ?????? ?????? ????????? ??? ?????? ?????? ??? ??? ????????? ?????? ?????? ???????????? ????????? ???????????? ????????? ?????? ????????? ????????? ???????????? ???????????? ???????????? ????????? ????????? ?????? ???????????????"),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: ' ?????? ????????? ????????????.'),
                  maxLines: 6,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final String name = _nameController.text;
                        final double? price =
                            double.tryParse(_priceController.text);
                        final String description = _descriptionController.text;

                        if (name != null)
                          await _mind.add({
                            "name": name,
                            "createTime": FieldValue.serverTimestamp(),
                            "updateTime": FieldValue.serverTimestamp(),
                          });
                        else
                          await _mind.add({
                            "name": name,
                            // "price": price,
                            // "description": description,
                            // "photo": 'https://www.handong.edu/site/handong/res/img/m_logo.png',
                            // "uID" :FirebaseAuth.instance.currentUser!.uid,
                            // "favorite" : 0,
                            "createTime": FieldValue.serverTimestamp(),
                            "updateTime": FieldValue.serverTimestamp(),
                          });

                        // }
                        _nameController.text = '';
                        _priceController.text = '';
                        _descriptionController.text = '';

                        Navigator.of(context).pop();
                      },
                      child: Text("??????"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(60, 0, 60, 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
