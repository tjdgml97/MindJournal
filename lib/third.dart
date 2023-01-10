import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'app.dart';
import 'home.dart';

class AddThird extends StatefulWidget {
  const AddThird({Key? key}) : super(key: key);

  @override
  State<AddThird> createState() => _AddThirdState();
}

class _AddThirdState extends State<AddThird> {
  final CollectionReference _mind =
      FirebaseFirestore.instance.collection('third');

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
    return Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(
            child: const Text('글쓰기'),
            onPressed: () async {
              final String name = _nameController.text;
              final double? price = double.tryParse(_priceController.text);
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
          ),
          title: const Text('마음일기'),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _nameController.clear();
                  _priceController.clear();
                  _descriptionController.clear();
                  Navigator.pushNamed(context, '/');
                },
                child: Text("Cancel")),
          ],
        ),
        backgroundColor: const Color(0xfff4f3f9),
        body: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.0),
            SizedBox(
              height: 10.0,
            ),
            AspectRatio(
              aspectRatio: 15 / 8,
              child: Image.network(
                'https://www.hanbit.co.kr/data/editor/20200219134956_vphynybz.jpg',
                // widget.docid['photo'],
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                  "만약 이랬다면 좋았을텐데 또는 했어야 했는데라는 생각으로 고통스럽고,\n 사랑했던 사람을 돕거나 죽음을 막기 위해 당신이 더 많은 것을 할 수 없었던 것을 깊이 후회하고 있다면\n고인에게 최소한 한장 분량의 편지를 써보세요\n무엇이든 고인에게 당신이 원하는 것을 말해보세요"),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: '나는'),
            ),
          ],
        ));
  }
}
