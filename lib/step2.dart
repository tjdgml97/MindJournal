import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'app.dart';
import 'home.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Step2Page extends StatefulWidget {
  const Step2Page({Key? key}) : super(key: key);

  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  final FlutterTts tts = FlutterTts();
  final TextEditingController controller =
      TextEditingController(text: 'Hello world');

  Home() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
  }

  final CollectionReference _mind = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('step2');

  late String photoUrl = "";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  //STORAGE 선언하기

  //final spaceRef = storageRef.chile(image!.path);

  // final storageRef = FirebaseStorage.instance.ref();
  // final mountainsRef = storageRef.child(_image!.path);

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.

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
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey)),
              onPressed: () {
                tts.speak(
                  "당신의 분노를 받아들인 뒤 이 감사연습을 해 볼 수 있습니다. 감사연습은 무엇이 고인과의 관계에서 힘을 주고 행복감을 주었는지 써보는 것입니다",
                );
              },
              child: Text('음성듣기')),
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
                  " Step 2 ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  " 감사연습 ",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                AspectRatio(
                  aspectRatio: 8 / 2,
                  child: Image.network(
                    'https://cdn2.iconfinder.com/data/icons/multimedia-and-communication-vol-4/100/thank_you-512.png', // widget.docid['photo'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    style: TextStyle(fontSize: 16),
                    "당신의 분노를 받아들인 뒤 이 '감사 연습'을 해 볼 수 있습니다."),
                Text(
                    style: TextStyle(fontSize: 16),
                    "감사연습은 무엇이 고인과의 관계에서 힘을 주고 행복감을 주었는지 써보는 것입니다."),
                SizedBox(
                  height: 10,
                ),
                Text(
                    style: TextStyle(fontSize: 14),
                    "예시) \"우리아들에게 좋은 아버지가 되어줘서 고마워. 결혼생활동안 사랑받고 있다고 느낄수 있었어.\""),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '고인에게 감사를 담아 짧은 편지를 써보세요.'),
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
                        // final String downloadurl = photoUrl;

                        // if(_image !=null) {
                        //   await _products.add({
                        //     "name": name,
                        //     "price": price,
                        //     "description": description,
                        //     "photo": await mountainsRef.getDownloadURL(),
                        //   });
                        // }
                        // else {

                        if (name != null)
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
                      child: Text("저장"),
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
