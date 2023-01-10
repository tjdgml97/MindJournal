import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'app.dart';
import 'home.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final FlutterTts tts = FlutterTts();
  final TextEditingController controller =
  TextEditingController(text: 'Hello world');

  Home() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
  }



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



  // final CollectionReference _mind=
  // FirebaseFirestore.instance.collection('mind');

  final CollectionReference _mind=
  FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).collection('diary');


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
      appBar: AppBar(
        title: Text("감정연습일지"),
      ),
      primary: true,
      body:ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("오늘도,\n반가워요 :)",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
          ),
          SizedBox(
            height: 200.0,
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10.0),
              childAspectRatio: 6.0 / 5.0,
              children: [
                //
                // Container(
                //   height: 5,
                //   width: 5,
                //   margin: EdgeInsets.only(left: 10, right: 10),
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     border: Border.all(color:Colors.black26),
                //     boxShadow: [
                //       BoxShadow(
                //           color: Colors.grey,
                //           blurRadius: 4.0,
                //           spreadRadius: 1.0,
                //           offset: Offset(-1, -1))
                //     ],
                //     color:  Color(0xffECE6CC),//FFCFAA//AA6A39
                //     borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children:[
                //           Text('  Step 5',
                //               style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
                //           ),
                //           Text('죄책감이들때 대처하기',
                //             style:TextStyle(fontSize: 14),
                //           ),],),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Container(
                //             width: 10,
                //             height: 10,
                //             // color:Colors.black26,
                //             child: AspectRatio(
                //               aspectRatio: 10 / 2,
                //               child: Image.network(
                //                 'https://cdn3.iconfinder.com/data/icons/medical-and-healthcare-1-4/85/heart_checkup_magnifier_cardiology_medicine_medical-512.png',
                //                 // widget.docid['photo'],
                //                 fit: BoxFit.scaleDown,
                //               ),
                //             ),
                //           ),
                //           IconButton(onPressed: (){
                //             Navigator.pushNamed(context, '/step5page');
                //           }, icon: Icon(Icons.navigate_next)),
                //         ],
                //       ),
                //       //TextButton(onPressed: (){ Navigator.pushNamed(context, '/step1page');}, child:Text("시작")),
                //     ],                          ),
                // ),

                Card(
                  surfaceTintColor: Colors.black26,
                  clipBehavior: Clip.antiAlias,
                  color:Color(0xffECE6CC),
                  shadowColor: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 20/ 10,
                        child: Image.network(
                          'https://cdn1.iconfinder.com/data/icons/office-322/24/email-message-envelope-letter-512.png',
                          // widget.docid['photo'],

                        ),
                      ),
                      Divider(height: 1, color: Colors.black26,),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          //Text("시작하기",style: TextStyle(color: Colors.black),),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/step');
                                //_update(documentSnapshot);
                              },
                              child: Text(" 연습 시작하기")),
                          // IconButton(
                          //   onPressed: (){
                          //     Navigator.pushNamed(
                          //         context, '/firsthome');
                          //   }, icon: Icon(Icons.home),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),

                Card(
                  clipBehavior: Clip.antiAlias,
                  color: Color(0xffECE6CC),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 20/ 10,
                        child: Image.network(
                          'https://cdn2.iconfinder.com/data/icons/shopping-273/512/mypage-512.png',                          // widget.docid['photo'],

                        ),
                      ),
                      Divider(height: 1, color: Colors.black26,),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/stephome');
                                //_update(documentSnapshot);
                              },
                              child: Text("감정일지")),

                          // IconButton(
                          //   onPressed: (){
                          //     Navigator.pushNamed(
                          //         context, '/firsthome');
                          //   }, icon: Icon(Icons.home),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),


              ],),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 330,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color:Colors.black26),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(-1, -1))
              ],
              color:  Color(0xffECE6CC),//FFCFAA//AA6A39
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            //color: Color(0xffECE6CC),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width:100,
                      height: 100,
                      child: AspectRatio(
                        aspectRatio: 4 / 4,
                        child: Image.network(
                          'https://cdn1.iconfinder.com/data/icons/clairvoyance/512/N_T_1355Artboard_1_copy_11-512.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Text("먼저 눈을 감고 나에게 집중해보세요\n몸 전체를 이완시키기 위해 \n천천히 깊게 숨을 들이마시고 내쉬세요\n"),
                    SizedBox(width: 13,),
                    ElevatedButton(
                        style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(Colors.grey)),
                        onPressed: () {
                          tts.speak(          "먼저 눈을 감고 나에게 집중해보세요 몸 전체를 이완시키기 위해 천천히 깊게 숨을 들이마시고 내쉬세요\n",
                          );
                        },
                        child: Text('음성듣기')),
                  ],
                ),
                  // mainAxisAlignment: MainAxisAlignment.center,
                  //  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                    Container(
                      width: 400,
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '생각들을 정리해보세요.'),
                        maxLines: 6,
                      ),
                    ),
                    //SizedBox(width: 10,),
                    //  SizedBox
                    //  (width: 20,),
                    // ElevatedButton(onPressed: (){_nameController.clear();}, child: Text("버리기")
                    //   ,style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                    //     padding: MaterialStateProperty.all(
                    //       EdgeInsets.fromLTRB(60,0,60,0),
                    //     ),),),
                    // ElevatedButton(onPressed: (){}, child: Text("hi")),
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

                  Navigator.pushNamed(context, '/');

                },
                  child: Text("저장")
                  ,style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(160,0,160,0),
                    ),
                  ),),
                // Expanded(
                //   child: Container(
                //     width:320,
                //     margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                //     decoration: BoxDecoration(
                //       color: Color(0xffECE6CC),
                //       border: Border.all(color: Colors.black),
                //     ),
                //     padding: EdgeInsets.all(30),
                //     child: Text(
                //       // If listening is active show the recognized words
                //       _speechToText.isListening
                //           ? '$_lastWords'
                //       // If listening isn't active but could be tell the user
                //       // how to start it, otherwise indicate that speech
                //       // recognition is not yet ready or not supported on
                //       // the target device
                //           : _speechEnabled
                //           ? '  마이크를 누르고 소리내서 말해보세요'
                //           : 'Speech not available',
                //     ),
                //   ),
                // ),
              ],
            ),
          ),

        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color:  Color(0xff6f6c61),
              ),
              child: Text('감정연습일지'),
            ),
            ListTile(
              title: const Text('연습 시작하기'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/step');
              },
            ),
            ListTile(
              title: const Text('감정일지'),
              onTap: () {
                Navigator.pushNamed(context, '/stephome');
              },
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: ()async{
                  await FirebaseAuth.instance.signOut();
                  print("성공");
                  Navigator.pushNamed(context, '/login');
                  await FirebaseAuth.instance.signOut();
                  print("성공");
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed:
      //   // If not yet listening for speech start, otherwise stop
      //   _speechToText.isNotListening ? _startListening : _stopListening,
      //   tooltip: 'Listen',
      //   child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      // ),
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



// // import 'dart:html';
//
// import 'dart:async';
// import 'package:lottie/lottie.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:flutter/services.dart';
// import 'dart:io';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
//
// import 'firebase_options.dart';
//
//
//
//
// // class AddProduct extends StatefulWidget {
// //   const AddProduct({Key? key}) : super(key: key);
// //
// //   @override
// //   State<AddProduct> createState() => _AddProductState();
// // }
// //
// // class _AddProductState extends State<AddProduct> {
// //
// //   final CollectionReference _products =
// //   FirebaseFirestore.instance.collection('product');
// //
// //   late  String photoUrl ="";
// //
// //
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _priceController = TextEditingController();
// //   final TextEditingController _descriptionController = TextEditingController();
// //
// //
// //
// //   //STORAGE 선언하기
// //
// //
// //   //final spaceRef = storageRef.chile(image!.path);
// //
// //   // final storageRef = FirebaseStorage.instance.ref();
// //   // final mountainsRef = storageRef.child(_image!.path);
// //
// //   // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           leading:
// //           ElevatedButton(
// //             child: const Text('Create'),
// //             onPressed: () async {
// //               final String name = _nameController.text;
// //               final double?  price = double.tryParse(_priceController.text);
// //               final String description = _descriptionController.text;
// //               // final String downloadurl = photoUrl;
// //               if (price != null) {
// //                 // if(_image !=null) {
// //                 //   await _products.add({
// //                 //     "name": name,
// //                 //     "price": price,
// //                 //     "description": description,
// //                 //     "photo": await mountainsRef.getDownloadURL(),
// //                 //   });
// //                 // }
// //                 // else {
// //
// //                 if(price!=null)
// //                   await _products.add({
// //                     "name": name,
// //                     "price": price,
// //                     "description": description,
// //                     "photo": 'https://www.handong.edu/site/handong/res/img/m_logo.png',
// //                     "uID" :FirebaseAuth.instance.currentUser!.uid,
// //                     "favorite" : 0,
// //                     "createTime" :FieldValue.serverTimestamp() ,
// //                     "updateTime" :FieldValue.serverTimestamp(),
// //                   });
// //                 else
// //                   await _products.add({
// //                     "name": name,
// //                     "price": price,
// //                     "description": description,
// //                     "photo": 'https://www.handong.edu/site/handong/res/img/m_logo.png',
// //                     "uID" :FirebaseAuth.instance.currentUser!.uid,
// //                     "favorite" : 0,
// //                     "createTime" :FieldValue.serverTimestamp() ,
// //                     "updateTime" :FieldValue.serverTimestamp(),
// //                   });
// //
// //
// //                 // }
// //                 _nameController.text = '';
// //                 _priceController.text = '';
// //                 _descriptionController.text = '';
// //
// //                 Navigator.of(context).pop();
// //               }
// //             },
// //           ),
// //           // TextButton(
// //           //   icon: const Icon(
// //           //     Icons.menu,
// //           //     semanticLabel: 'menu',
// //           //   ),
// //           //   onPressed: () async {
// //           //     print('Menu button');
// //           //     var data = {'name' : 'sh'};
// //           //     FirebaseFirestore.instance.collection('user').add(data).then((value) => print("save"));
// //           //
// //           //   },
// //           // ),
// //           title: const Text('마음일기'),
// //           actions: <Widget>[
// //             ElevatedButton(
// //                 onPressed: () {
// //                   _nameController.clear();
// //                   _priceController.clear();
// //                   _descriptionController.clear();
// //                   Navigator.pushNamed(context,'/');
// //                 },
// //                 child: Text("Cancel")),
// //             // IconButton(
// //             //   icon: const Icon(
// //             //     Icons.search,
// //             //     semanticLabel: 'search',
// //             //   ),
// //             //   onPressed: () {
// //             //     print('Search button');
// //             //   },
// //             // ),
// //             // IconButton(
// //             //   icon: const Icon(
// //             //     Icons.add,
// //             //     semanticLabel: 'filter',
// //             //   ),
// //             //   onPressed: () {
// //             //     Navigator.pushNamed(context,'/add');
// //             //     //_update(documentSnapshot);
// //             //   },
// //             // ),
// //           ],
// //         ),
// //         backgroundColor: const Color(0xfff4f3f9),
// //         body: ListView(
// //           //mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             SizedBox(height: 25.0),
// //             SizedBox(
// //               height: 50.0,
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: <Widget>[
// //                 // 카메라 촬영 버튼
// //
// //
// //                 // 갤러리에서 이미지를 가져오는 버튼
// //               ],
// //             ),
// //             TextField(
// //               controller: _nameController,
// //               decoration: const InputDecoration(labelText: 'Product Name'),
// //             ),
// //             TextField(
// //               // keyboardType:
// //               // const TextInputType.numberWithOptions(decimal: true),
// //               controller: _priceController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Price',
// //               ),
// //             ),
// //             TextField(
// //               controller: _descriptionController,
// //               decoration: const InputDecoration(labelText: 'Description'),
// //             ),
// //
// //           ],
// //         ));
// //   }
// // }
//
// // File? _image;
// //  PickedFile? _image;
// //
// //  Future getImageFromGallery() async {
// //    var image = await ImagePicker.platform.pickImage(
// //        source: ImageSource.gallery);
// //    setState(() {
// //      _image = image!;
// //    });
// //  }
// //  @override
// //  Widget build(BuildContext context) {
// //    return Column(
// //      children: [
// //        Container(
// //          width: MediaQuery.of(context).size.width,
// //          child :  Center(
// //              child: _image == null
// //                  ? Image.network('https://www.handong.edu/site/handong/res/img/m_logo.png')
// //                  : Image.file(File(_image!.path)),
// //          ),
// //        ),
// //        // Center(
// //        //   child: _image == null
// //        //       ? Image.network('https://www.handong.edu/site/handong/res/img/m_logo.png')
// //        //       : Image.file(File(_image!.path)),
// //        // ),
// //        IconButton(
// //            onPressed: getImageFromGallery,
// //            tooltip: 'Pick Image',
// //            icon: Icon(Icons.camera)
// //        ),
// //      ],
// //    );
// //  }
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//
//   final CollectionReference _products =
//   FirebaseFirestore.instance.collection('product');
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//
//   // get _photoUrl => photoUrl;
//
//   // Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
//   //
//   //   await showModalBottomSheet(
//   //       isScrollControlled: true,
//   //       context: context,
//   //       builder: (BuildContext ctx) {
//   //         return Padding(
//   //           padding: EdgeInsets.only(
//   //               top: 20,
//   //               left: 20,
//   //               right: 20,
//   //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
//   //           child: Column(
//   //             mainAxisSize: MainAxisSize.min,
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             children: [
//   //               TextField(
//   //                 controller: _nameController,
//   //                 decoration: const InputDecoration(labelText: 'Name'),
//   //               ),
//   //               TextField(
//   //                 keyboardType:
//   //                 const TextInputType.numberWithOptions(decimal: true),
//   //                 controller: _priceController,
//   //                 decoration: const InputDecoration(
//   //                   labelText: 'Price',
//   //                 ),
//   //               ),
//   //               const SizedBox(
//   //                 height: 20,
//   //               ),
//   //               ElevatedButton(
//   //                 child: const Text('Create'),
//   //                 onPressed: () async {
//   //                   final String name = _nameController.text;
//   //                   final double? price =
//   //                   double.tryParse(_priceController.text);
//   //                   if (price != null) {
//   //                     await _products.add({"name": name, "price": price,"photo":photoUrl});
//   //
//   //                     _nameController.text = '';
//   //                     _priceController.text = '';
//   //                     Navigator.of(context).pop();
//   //                   }
//   //                 },
//   //               )
//   //             ],
//   //           ),
//   //         );
//   //
//   //       });
//   // }
//
//   // Future<void> _add([DocumentSnapshot? documentSnapshot])async {
//   //   return Column(
//   //     children: [
//   //
//   //     ],
//   //   )
//   // }
//
//
//   Future<void> _delete([DocumentSnapshot? documentSnapshot])async {
//     if(documentSnapshot != null) {
//       _nameController.text = documentSnapshot['name'];
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     bool BOOL=false;
//     // final _valueList = ['asc','desc'];
//     // var selectedValue='asc';
//
//     //profileProvider.getFriends();
//     // CartProvider cartProvider = Provider.of<CartProvider>(context);
//     return Scaffold(
//       backgroundColor: Color(0xffECE6CC),
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.person,
//             semanticLabel: 'menu',
//           ),
//           onPressed: () async {
//             Navigator.pushNamed(context,'/profile');
//             // print('Menu button');
//             // var data = {'name' : 'sh'};
//             // // FirebaseFirestore.instance.collection('user').add(data).then((value) => print("save"));
//             // FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).set({"name":"test"}).then((value) => print("save"));
//             // print("click menubutton");
//             // print(FirebaseAuth.instance.currentUser!.uid);
//           },
//         ),
//         title: const Text('마음일지'),
//         actions: <Widget>[
//
//           // IconButton(
//           //   icon: const Icon(
//           //     Icons.create_sharp,
//           //     semanticLabel: 'filter',
//           //   ),
//           //   onPressed: () {
//           //     Navigator.pushNamed(context,'/add');
//           //     //_update(documentSnapshot);
//           //   },
//           // ),
//         ],
//       ),
//       body:
//       Container(
//         child:DropdownButtonExample(),
//       ),
//     );
//   }
// }
//
// bool _descorder = false;
//
// //const List<String> list = <String>['asc', 'desc'];
//
// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({Key? key}) : super(key: key);
//
//
//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }
//
// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//  // String dropdownValue = list.first;
//   int count = 0;
//   bool _BOOL = false;
//
//   final CollectionReference _products =
//   FirebaseFirestore.instance.collection('product');
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(
//       children: [
//         //  Text('$count'),
//
//         Expanded(
//           child: SizedBox(
//             child: StreamBuilder (
//               stream: _products.snapshots(),//:(_products.orderBy("price",descending:false)).snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//                 //String docID = "";
//                 if(streamSnapshot.hasData) {
//                   //int count = 30;
//                   return Column(
//                     children: [
//                    //   SizedBox(height: 30,),
//                       SizedBox (
//                         child:Container(
//                           padding: EdgeInsets.all(10) ,
//                           width: 450,
//                           height:150,
//                           // color: Color(0xffc6bb8c),
//                           color:Colors.brown,
//                            child:Center(
//                             child:Column(
//                              children:[
//                                SizedBox(height: 10,),
//                               Text("안녕하세요 :)",style: TextStyle(color: Colors.white),),
//                               // IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_fill_rounded)),
//                               Center(
//                                 child: Text(style: TextStyle(color: Colors.white),"먼저 눈을 감고 나에게 집중해보세요\n몸 전체를 이완시키기 위해 \n천천히 깊게 숨을 들이마시고 내쉬세요"),
//                               ) ,
//                                IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_fill_rounded)),
// //.\n지금으로부터 1,2년후 당신외 될것같은 모습과 당신이 만들게 될 긍정적인 변화를 시각화해보세요.  주위에는 누가있는지 당신의 일상생활은 어떠한지 당신이 무엇을 믿고있는지 시각화해보세요."),
//                         ],),
//                       ),),),
//                       Container(
//
//                         height:150,
//                         width:290,
//                         child: Row(
//                 children:[
//                   TextButton( onPressed: () {
//        Navigator.pushNamed(context, '/step');
//      }, child: Text("단계별 도전하기"),),
//                   Lottie.network('https://assets2.lottiefiles.com/packages/lf20_DhDBPwPo2Z.json'),
//
//                 ],
//                 ) ,// child:IconButton(
//                         //   onPressed: () {
//                         //   Navigator.pushNamed(context, '/step');
//                         // }, icon: Icon(Icons.start_rounded),),
//                       ),
//                       Divider(height: 1,thickness: 5,color: Colors.brown,),
//                       Expanded(
//                         child: SizedBox(
//                           height: 200.0,
//                           child: GridView.count(
//                             crossAxisCount: 2,
//                             padding: const EdgeInsets.all(1.0),
//                             childAspectRatio: 8.0 / 9.0,
//                             children: [
//                               Card(
//                                 clipBehavior: Clip.antiAlias,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     AspectRatio(
//                                       aspectRatio: 18 / 13,
//                                       child: Image.network(
//                                         'https://www.hanbit.co.kr/data/editor/20200219134956_vphynybz.jpg',
//                                         // widget.docid['photo'],
//                                         fit: BoxFit.fitWidth,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment
//                                           .center,
//                                       children: [
//                                         Text("마음일기"),
//                                         IconButton(
//                                             onPressed: () {
//                                               Navigator.pushNamed(
//                                                   context, '/add');
//                                               //_update(documentSnapshot);
//                                             },
//                                             icon: Icon(Icons.create_sharp)),
//                                         IconButton(
//                                           onPressed: (){
//                                             Navigator.pushNamed(
//                                                 context, '/firsthome');
//                                           }, icon: Icon(Icons.home),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//
//                               Card(
//                                 clipBehavior: Clip.antiAlias,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     AspectRatio(
//                                       aspectRatio: 18 / 13,
//                                       child: Image.network(
//                                         'https://www.hanbit.co.kr/data/editor/20200219134956_vphynybz.jpg',
//                                         // widget.docid['photo'],
//                                         fit: BoxFit.fitWidth,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment
//                                           .center,
//                                       children: [
//                                         Text("감사일기"),
//                                         IconButton(
//                                             onPressed: () {
//                                               Navigator.pushNamed(
//                                                   context, '/addsecond');
//                                               //_update(documentSnapshot);
//                                             },
//                                             icon: Icon(Icons.create_sharp)),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//
//
//                               Card(
//                                 clipBehavior: Clip.antiAlias,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     AspectRatio(
//                                       aspectRatio: 18 / 13,
//                                       child: Image.network(
//                                         'https://www.hanbit.co.kr/data/editor/20200219134956_vphynybz.jpg',
//                                         // widget.docid['photo'],
//                                         fit: BoxFit.fitWidth,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment
//                                           .center,
//                                       children: [
//                                         Text("죄책감이 들때"),
//                                         IconButton(
//                                             onPressed: () {
//                                               Navigator.pushNamed(
//                                                   context, '/addthird');
//                                               //_update(documentSnapshot);
//                                             },
//                                             icon: Icon(Icons.create_sharp)),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//
//
//                               Card(
//                                 clipBehavior: Clip.antiAlias,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     AspectRatio(
//                                       aspectRatio: 18 / 13,
//                                       child: Image.network(
//                                         'https://www.hanbit.co.kr/data/editor/20200219134956_vphynybz.jpg',
//                                         // widget.docid['photo'],
//                                         fit: BoxFit.fitWidth,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment
//                                           .center,
//                                       children: [
//                                         Text(".."),
//                                         IconButton(
//                                             onPressed: () {
//                                               Navigator.pushNamed(
//                                                   context, '/addforth');
//                                               //_update(documentSnapshot);
//                                             },
//                                             icon: Icon(Icons.create_sharp)),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//
//
//                             ],
//
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//                 return const Center(
//                   child: Text('none'),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
