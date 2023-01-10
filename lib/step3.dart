import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'firebase_options.dart';

import 'app.dart';
import 'home.dart';

class Step3Page extends StatefulWidget {
  const Step3Page({Key? key}) : super(key: key);

  @override
  State<Step3Page> createState() => _Step3PageState();
}

class _Step3PageState extends State<Step3Page> {
  final CollectionReference _mind = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('step3');

  late String photoUrl = "";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    final storageRef = FirebaseStorage.instance.ref();
    final String current_M = (DateTime.now().millisecondsSinceEpoch).toString();
    final mountainsRef = storageRef.child(current_M);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });

    await mountainsRef.putFile(_image!);

    photoUrl = await mountainsRef.getDownloadURL();

    print(photoUrl);
  }

  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Image.network(
                    'https://cdn4.iconfinder.com/data/icons/48-bubbles/48/20.Photos-512.png')
                : Image.file(_image!) //: Image.file(File(_image!.path)
            ));
  }

  //STORAGE 선언하기

  //final spaceRef = storageRef.chile(image!.path);

  // final storageRef = FirebaseStorage.instance.ref();
  // final mountainsRef = storageRef.child(_image!.path);

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.

  @override
  Widget build(BuildContext context) {
    final String name = _nameController.text;
    final String downloadurl = photoUrl;

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
            height: 1000,
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
                  " Step 3 ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  " 사랑하는 사람이 내게 남긴 것 ",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                AspectRatio(
                  aspectRatio: 8 / 2,
                  child: Image.network(
                    'https://cdn4.iconfinder.com/data/icons/48-bubbles/48/20.Photos-512.png',
                    // widget.docid['photo'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    style: TextStyle(fontSize: 15),
                    "지금은 내면을 들여다보고 자신이 가치있는 사람이라고 스스로 인지해야합니다."),
                Text(
                    style: TextStyle(fontSize: 15),
                    "당신에게 중요한 사람들이 이전에 해주었던 긍정적인 말들, 함께했던 좋은 추억들을 기억해야 할 때입니다."),
                Text(
                    style: TextStyle(fontSize: 15),
                    "그 메세지들을 편지형식으로 기록하거나 추억들을 남겨보세요."),
                //Text("예시)  "),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  color: Colors.black,
                ),
                //이미지
                SizedBox(height: 25.0),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      child: showImage(),
                      height: 150,
                      width: 240,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white38,
                        child: Icon(Icons.wallpaper),
                        tooltip: '사진선택하기',
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "TO.사랑하는 OO에게"),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '남긴 메세지나 추억을 기록해보세요.'),
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
                        //   final double?  price = double.tryParse(_priceController.text);
                        final String description = _descriptionController.text;
                        final String downloadurl = photoUrl;

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

                        if (_image == null)
                          await _mind.add({
                            "name": name,
                            "photo":
                                'https://cdn4.iconfinder.com/data/icons/48-bubbles/48/20.Photos-512.png',
                            // "uID" :FirebaseAuth.instance.currentUser!.uid,
                            "createTime": FieldValue.serverTimestamp(),
                            "updateTime": FieldValue.serverTimestamp(),
                          });
                        else
                          await _mind.add({
                            "name": name,
                            "photo":
                                'https://cdn4.iconfinder.com/data/icons/48-bubbles/48/20.Photos-512.png',
                            //  "uID" :FirebaseAuth.instance.currentUser!.uid,
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
