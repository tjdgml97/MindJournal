import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'app.dart';
import 'home.dart';

class Step5Page extends StatefulWidget {
  const Step5Page({Key? key}) : super(key: key);

  @override
  State<Step5Page> createState() => _Step5PageState();
}

class _Step5PageState extends State<Step5Page> {
  final CollectionReference _mind = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('step4');

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
                  " Step 5 ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "사랑하는 사람이 당신에게 하고싶은말 ",
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
                Text(
                  "빈칸에 본인의 이름을 넣어 따라 읽어보세요.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                SizedBox(
                  height: 15,
                ),
                Text("언젠가 내가 당신에게 물은 적이 있다.\n 우리한테 도대체 왜 이런 일이 일어나는 거냐고\n"),

                Text(
                    "당신은 내게 말했다 \n인생엔 나쁜일도 좋은 일도 일어난다\n우린 그것들을 선택할 수가 없으니\n나쁜 일이 생겼을 땐 최대한 슬퍼하며 쓰러져서 엉엉 울어야 한다\n대신 언젠가 좋은일이 생긴다면\n최대한 기뻐하며 할 수 있는 한 많이 웃고 즐거워하며\nOO 인생을 사랑해줘야해.\n 사랑하는 나의  OO 아 "), // Container(
                //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //   width: 400,
                //   height: 100,
                //   decoration: BoxDecoration(
                //     color: Color(0xffECE6CC),
                //     border: Border.all(color: Colors.black),
                //   ),
                //   child: Center(
                //     child: Text("성희에게", style: TextStyle(fontSize: 13),),),
                // ),

                // TextField(
                //   controller: _nameController,
                //   decoration: const InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: '소리내서 말하거나 짧은 글을 써보세요'),
                //   maxLines: 6,
                // ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
