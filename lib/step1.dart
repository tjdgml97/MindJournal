import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'app.dart';
import 'home.dart';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Step1Page extends StatefulWidget {
  const Step1Page({Key? key}) : super(key: key);

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  final CollectionReference _mind = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('step1');

  late String photoUrl = "";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  //STORAGE 선언하기

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
            height: 600,
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
                    " Step 1 ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " 분노연습 ",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AspectRatio(
                    aspectRatio: 8 / 2,
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/8774/8774882.png',
                      // widget.docid['photo'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                      style: TextStyle(fontSize: 15.5),
                      "몹시사랑하던 사람을 갑작스레 잃었는데 화가나는 것은 자연스럽고 건강한 애도반응의 일부입니다.\n당신의 분노를 담아 큰소리로 기도하거나 신에게 악을 쓰듯 외쳐보는게 도움이 될 수 있어요"),
                  Text(
                      style: TextStyle(fontSize: 14),
                      "\n[예시]\n** 에게 , 친구는 친구를 버리지 않아. \n어떻게 마지막 인사도 안해주니\n신이시여, 고통이 끔찍합니다. 제배우자에게 당신에게도 화가 납니다. 제가 감당할수 없는 고통입니다.\n"),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/step1_1page');
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
