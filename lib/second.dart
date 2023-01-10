import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'app.dart';
import 'home.dart';

class AddSecond extends StatefulWidget {
  const AddSecond({Key? key}) : super(key: key);

  @override
  State<AddSecond> createState() => _AddProductState();
}

class _AddProductState extends State<AddSecond> {

  final CollectionReference _mind=
  FirebaseFirestore.instance.collection('second');

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
    return Scaffold(
        appBar: AppBar(
          leading:
          ElevatedButton(
            child: const Text('글쓰기'),
            onPressed: () async {
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
          ),
          // TextButton(
          //   icon: const Icon(
          //     Icons.menu,
          //     semanticLabel: 'menu',
          //   ),
          //   onPressed: () async {
          //     print('Menu button');
          //     var data = {'name' : 'sh'};
          //     FirebaseFirestore.instance.collection('user').add(data).then((value) => print("save"));
          //
          //   },
          // ),
          title: const Text('마음일기'),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _nameController.clear();
                  _priceController.clear();
                  _descriptionController.clear();
                  Navigator.pushNamed(context,'/');

                },
                child: Text("Cancel")),
            // IconButton(
            //   icon: const Icon(
            //     Icons.search,
            //     semanticLabel: 'search',
            //   ),
            //   onPressed: () {
            //     print('Search button');
            //   },
            // ),
            // IconButton(
            //   icon: const Icon(
            //     Icons.add,
            //     semanticLabel: 'filter',
            //   ),
            //   onPressed: () {
            //     Navigator.pushNamed(context,'/add');
            //     //_update(documentSnapshot);
            //   },
            // ),
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
              child:  Text("고인과의 관계에서 힘을 주고\n 행복감을 주었던것이 무엇인지 써보세요\n당신이 느낀 행복함과 소중한것들은 사라지는것이 아닙니다\n철자법이나 문법, 문체에 대해 걱정하지 마세요\n"),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "그냥 말을 꺼내놓으세요"),
            ),
            // TextField(
            //   controller: _nameController,
            //   decoration: const InputDecoration(labelText: '오늘 하루동안 있었던 일은 '),
            // ),
            // TextField(
            //   controller: _nameController,
            //   decoration: const InputDecoration(labelText: '지금 나의 기분은 '),
            // ),

          ],
        ));
  }
}