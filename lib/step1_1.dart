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

class Step1_1Page extends StatefulWidget {
  const Step1_1Page({Key? key}) : super(key: key);

  @override
  State<Step1_1Page> createState() => _Step1_1PageState();
}

class _Step1_1PageState extends State<Step1_1Page> {

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

  // late speechToText.SpeechToText speech;
  // String textString = "Press The Button";
  // bool isListen = false;
  // double confidence = 1.0;
  // final Map<String, HighlightedWord> highlightWords = {
  //   "flutter": HighlightedWord(
  //       textStyle:
  //       TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
  //   "developer": HighlightedWord(
  //       textStyle:
  //       TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
  // };
  //
  // void listen() async {
  //   if (!isListen) {
  //     bool avail = await speech.initialize();
  //     if (avail) {
  //       setState(() {
  //         isListen = true;
  //       });
  //       speech.listen(onResult: (value) {
  //         setState(() {
  //           textString = value.recognizedWords;
  //           if (value.hasConfidenceRating && value.confidence > 0) {
  //             confidence = value.confidence;
  //           }
  //         });
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       isListen = false;
  //     });
  //     speech.stop();
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   speech = speechToText.SpeechToText();
  // }



  final CollectionReference _mind=
  FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).collection('step1');

  late  String photoUrl ="";


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
        title:Text('Challenge'),
      ),
      body:ListView(
        children: [
          SizedBox(height: 20,),
          Container(
            height: 700,
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
                    SizedBox(height: 5,),
                    Text(" Step 1 ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text(" 분노연습 ",style: TextStyle(fontSize: 18),),
                    SizedBox(height: 20,),
                    AspectRatio(
                      aspectRatio: 8 / 2,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/8774/8774882.png',
                        // widget.docid['photo'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Text("소리를 내서 분노를 표현하는것이 어렵다고 느껴진다면, 짧은 글을 써보세요\n", style:TextStyle(fontSize: 17, ),),

                    SizedBox(height: 5,),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '소리내서 말하거나 짧은 글을 써보세요'),
                      maxLines: 4,
                    ),


                    //       ///
                    //
                    //
                    //     Container(
                    //       child: Text(
                    //         "Confidence: ${(confidence * 100.0).toStringAsFixed(1)}%",
                    //         style: TextStyle(
                    //             fontSize: 20.0,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.red),
                    //       ),
                    //     ),
                    //     Container(
                    //       padding: EdgeInsets.all(20),
                    //       child: TextHighlight(
                    //         text: textString,
                    //         words: highlightWords,
                    //         textStyle: TextStyle(
                    //             fontSize: 25.0,
                    //             color: Colors.black,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //
                    //
                    //
                    // ///



                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width:240,
                        ),
                        ElevatedButton(onPressed:()  async {
                          final String name = _nameController.text;
                          final double?  price = double.tryParse(_priceController.text);
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

                          if(name!=null)
                            await _mind.add({
                              "name": name,
                              // "price": price,
                              // "description": description,
                              // "photo": 'https://www.handong.edu/site/handong/res/img/m_logo.png',
                              // "uID" :FirebaseAuth.instance.currentUser!.uid,
                              // "favorite" : 0,
                              "createTime" :FieldValue.serverTimestamp() ,
                              "updateTime" :FieldValue.serverTimestamp(),
                            });
                          else
                            await _mind.add({
                              "name": name,
                              // "price": price,
                              // "description": description,
                              // "photo": 'https://www.handong.edu/site/handong/res/img/m_logo.png',
                              // "uID" :FirebaseAuth.instance.currentUser!.uid,
                              // "favorite" : 0,
                              "createTime" :FieldValue.serverTimestamp() ,
                              "updateTime" :FieldValue.serverTimestamp(),
                            });


                          // }
                          _nameController.text = '';
                          _priceController.text = '';
                          _descriptionController.text = '';

                          Navigator.of(context).pop();

                        },
                          child: Text("저장")
                          ,style: ButtonStyle(backgroundColor: MaterialStateProperty.all( Color(0xff6f6c61),),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(30,0,30,0),
                            ),
                          ),),
                        //SizedBox(width: 20,),
                        // ElevatedButton(onPressed: (){_nameController.clear();}, child: Text("버리기")
                        //   ,style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff6f6c61),),
                        //     padding: MaterialStateProperty.all(
                        //       EdgeInsets.fromLTRB(60,0,60,0),
                        //     ),),),
                        // ElevatedButton(onPressed: (){}, child: Text("hi")),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width:320,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        decoration: BoxDecoration(
                          color: Color(0xffECE6CC),
                          border: Border.all(color: Colors.black),
                        ),
                        padding: EdgeInsets.all(30),
                        child: Text(
                          // If listening is active show the recognized words
                          _speechToText.isListening
                              ? '$_lastWords'
                          // If listening isn't active but could be tell the user
                          // how to start it, otherwise indicate that speech
                          // recognition is not yet ready or not supported on
                          // the target device
                              : _speechEnabled
                              ? '  마이크를 누르고 소리내서 말해보세요'
                              : 'Speech not available',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width:240,
                        ),
                        ElevatedButton(onPressed:()  async {
                          final String name = _nameController.text;
                          final double?  price = double.tryParse(_priceController.text);
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

                          if(name!=null)
                            await _mind.add({
                              "name": name,
                              // "price": price,
                              // "description": description,
                              // "photo": 'https://www.handong.edu/site/handong/res/img/m_logo.png',
                              // "uID" :FirebaseAuth.instance.currentUser!.uid,
                              // "favorite" : 0,
                              "createTime" :FieldValue.serverTimestamp() ,
                              "updateTime" :FieldValue.serverTimestamp(),
                            });
                          else
                            await _mind.add({
                              "name": name,
                              // "price": price,
                              // "description": description,
                              // "photo": 'https://www.handong.edu/site/handong/res/img/m_logo.png',
                              // "uID" :FirebaseAuth.instance.currentUser!.uid,
                              // "favorite" : 0,
                              "createTime" :FieldValue.serverTimestamp() ,
                              "updateTime" :FieldValue.serverTimestamp(),
                            });


                          // }
                          _nameController.text = '';
                          _priceController.text = '';
                          _descriptionController.text = '';

                          Navigator.of(context).pop();

                        },
                          child: Text("저장")
                          ,style: ButtonStyle(backgroundColor: MaterialStateProperty.all( Color(0xff6f6c61),),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(30,0,30,0),
                            ),
                          ),),
                      ],
                    ),
                  ],
                )
            ),
          ),


          // Container(
          //   padding: EdgeInsets.all(16),
          //   child: Text(
          //     'Recognized words:',
          //     style: TextStyle(fontSize: 20.0),
          //   ),
          // ),




        ],
      ),

      // floatingActionButton: AvatarGlow(
      //   animate: isListen,
      //   glowColor: Colors.red,
      //   endRadius: 65.0,
      //   duration: Duration(milliseconds: 2000),
      //   repeatPauseDuration: Duration(milliseconds: 100),
      //   repeat: true,
      //   child: FloatingActionButton(
      //     child: Icon(isListen ? Icons.mic : Icons.mic_none),
      //     onPressed: () {
      //       listen();
      //     },
      //   ),
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed:
        // If not yet listening for speech start, otherwise stop
        _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),

    );
    // return Container(
    //   color: Color(0xffECE6CC),
    //
    //   child: Column(
    //     children:[
    //     Text("날짜 : ",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),),
    //     Text("sh"),
    //     ],
    //   ),
    // );
  }
}