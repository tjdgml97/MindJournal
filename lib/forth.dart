// import 'dart:html';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/services.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';




// class AddProduct extends StatefulWidget {
//   const AddProduct({Key? key}) : super(key: key);
//
//   @override
//   State<AddProduct> createState() => _AddProductState();
// }
//
// class _AddProductState extends State<AddProduct> {
//
//   final CollectionReference _products =
//   FirebaseFirestore.instance.collection('product');
//
//   late  String photoUrl ="";
//
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//
//
//
//   //STORAGE 선언하기
//
//
//   //final spaceRef = storageRef.chile(image!.path);
//
//   // final storageRef = FirebaseStorage.instance.ref();
//   // final mountainsRef = storageRef.child(_image!.path);
//
//   // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading:
//           ElevatedButton(
//             child: const Text('Create'),
//             onPressed: () async {
//               final String name = _nameController.text;
//               final double?  price = double.tryParse(_priceController.text);
//               final String description = _descriptionController.text;
//               // final String downloadurl = photoUrl;
//               if (price != null) {
//                 // if(_image !=null) {
//                 //   await _products.add({
//                 //     "name": name,
//                 //     "price": price,
//                 //     "description": description,
//                 //     "photo": await mountainsRef.getDownloadURL(),
//                 //   });
//                 // }
//                 // else {
//
//                 if(price!=null)
//                   await _products.add({
//                     "name": name,
//                     "price": price,
//                     "description": description,
//                     "photo": 'https://www.handong.edu/site/handong/res/img/m_logo.png',
//                     "uID" :FirebaseAuth.instance.currentUser!.uid,
//                     "favorite" : 0,
//                     "createTime" :FieldValue.serverTimestamp() ,
//                     "updateTime" :FieldValue.serverTimestamp(),
//                   });
//                 else
//                   await _products.add({
//                     "name": name,
//                     "price": price,
//                     "description": description,
//                     "photo": 'https://www.handong.edu/site/handong/res/img/m_logo.png',
//                     "uID" :FirebaseAuth.instance.currentUser!.uid,
//                     "favorite" : 0,
//                     "createTime" :FieldValue.serverTimestamp() ,
//                     "updateTime" :FieldValue.serverTimestamp(),
//                   });
//
//
//                 // }
//                 _nameController.text = '';
//                 _priceController.text = '';
//                 _descriptionController.text = '';
//
//                 Navigator.of(context).pop();
//               }
//             },
//           ),
//           // TextButton(
//           //   icon: const Icon(
//           //     Icons.menu,
//           //     semanticLabel: 'menu',
//           //   ),
//           //   onPressed: () async {
//           //     print('Menu button');
//           //     var data = {'name' : 'sh'};
//           //     FirebaseFirestore.instance.collection('user').add(data).then((value) => print("save"));
//           //
//           //   },
//           // ),
//           title: const Text('마음일기'),
//           actions: <Widget>[
//             ElevatedButton(
//                 onPressed: () {
//                   _nameController.clear();
//                   _priceController.clear();
//                   _descriptionController.clear();
//                   Navigator.pushNamed(context,'/');
//                 },
//                 child: Text("Cancel")),
//             // IconButton(
//             //   icon: const Icon(
//             //     Icons.search,
//             //     semanticLabel: 'search',
//             //   ),
//             //   onPressed: () {
//             //     print('Search button');
//             //   },
//             // ),
//             // IconButton(
//             //   icon: const Icon(
//             //     Icons.add,
//             //     semanticLabel: 'filter',
//             //   ),
//             //   onPressed: () {
//             //     Navigator.pushNamed(context,'/add');
//             //     //_update(documentSnapshot);
//             //   },
//             // ),
//           ],
//         ),
//         backgroundColor: const Color(0xfff4f3f9),
//         body: ListView(
//           //mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 25.0),
//             SizedBox(
//               height: 50.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 // 카메라 촬영 버튼
//
//
//                 // 갤러리에서 이미지를 가져오는 버튼
//               ],
//             ),
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Product Name'),
//             ),
//             TextField(
//               // keyboardType:
//               // const TextInputType.numberWithOptions(decimal: true),
//               controller: _priceController,
//               decoration: const InputDecoration(
//                 labelText: 'Price',
//               ),
//             ),
//             TextField(
//               controller: _descriptionController,
//               decoration: const InputDecoration(labelText: 'Description'),
//             ),
//
//           ],
//         ));
//   }
// }

// File? _image;
//  PickedFile? _image;
//
//  Future getImageFromGallery() async {
//    var image = await ImagePicker.platform.pickImage(
//        source: ImageSource.gallery);
//    setState(() {
//      _image = image!;
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: [
//        Container(
//          width: MediaQuery.of(context).size.width,
//          child :  Center(
//              child: _image == null
//                  ? Image.network('https://www.handong.edu/site/handong/res/img/m_logo.png')
//                  : Image.file(File(_image!.path)),
//          ),
//        ),
//        // Center(
//        //   child: _image == null
//        //       ? Image.network('https://www.handong.edu/site/handong/res/img/m_logo.png')
//        //       : Image.file(File(_image!.path)),
//        // ),
//        IconButton(
//            onPressed: getImageFromGallery,
//            tooltip: 'Pick Image',
//            icon: Icon(Icons.camera)
//        ),
//      ],
//    );
//  }


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final CollectionReference _products =
  FirebaseFirestore.instance.collection('product');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // get _photoUrl => photoUrl;

  // Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
  //
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               top: 20,
  //               left: 20,
  //               right: 20,
  //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextField(
  //                 controller: _nameController,
  //                 decoration: const InputDecoration(labelText: 'Name'),
  //               ),
  //               TextField(
  //                 keyboardType:
  //                 const TextInputType.numberWithOptions(decimal: true),
  //                 controller: _priceController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Price',
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               ElevatedButton(
  //                 child: const Text('Create'),
  //                 onPressed: () async {
  //                   final String name = _nameController.text;
  //                   final double? price =
  //                   double.tryParse(_priceController.text);
  //                   if (price != null) {
  //                     await _products.add({"name": name, "price": price,"photo":photoUrl});
  //
  //                     _nameController.text = '';
  //                     _priceController.text = '';
  //                     Navigator.of(context).pop();
  //                   }
  //                 },
  //               )
  //             ],
  //           ),
  //         );
  //
  //       });
  // }

  // Future<void> _add([DocumentSnapshot? documentSnapshot])async {
  //   return Column(
  //     children: [
  //
  //     ],
  //   )
  // }


  Future<void> _delete([DocumentSnapshot? documentSnapshot])async {
    if(documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
    }
  }



  @override
  Widget build(BuildContext context) {

    bool BOOL=false;
    // final _valueList = ['asc','desc'];
    // var selectedValue='asc';

    //profileProvider.getFriends();
    // CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            semanticLabel: 'menu',
          ),
          onPressed: () async {
            Navigator.pushNamed(context,'/profile');
            // print('Menu button');
            // var data = {'name' : 'sh'};
            // // FirebaseFirestore.instance.collection('user').add(data).then((value) => print("save"));
            // FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).set({"name":"test"}).then((value) => print("save"));
            // print("click menubutton");
            // print(FirebaseAuth.instance.currentUser!.uid);
          },
        ),
        title: const Text('마음일지'),
        actions: <Widget>[

          // IconButton(
          //   icon: const Icon(
          //     Icons.create_sharp,
          //     semanticLabel: 'filter',
          //   ),
          //   onPressed: () {
          //     Navigator.pushNamed(context,'/add');
          //     //_update(documentSnapshot);
          //   },
          // ),
        ],
      ),
      body:
      Container(
        child:DropdownButtonExample(),
      ),
    );
  }
}

bool _descorder = false;

//const List<String> list = <String>['asc', 'desc'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);


  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  // String dropdownValue = list.first;
  int count = 0;
  bool _BOOL = false;

  final CollectionReference _products =
  FirebaseFirestore.instance.collection('product');

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        //  Text('$count'),

        Expanded(
          child: SizedBox(
            child: StreamBuilder (
              stream: _products.snapshots(),//:(_products.orderBy("price",descending:false)).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                //String docID = "";
                if(streamSnapshot.hasData) {
                  //int count = 30;
                  return Column(
                    children: [
                      //   SizedBox(height: 30,),
                      SizedBox (
                        child:Container(
                          padding: EdgeInsets.all(10) ,
                          width: 450,
                          height:150,
                          // color: Color(0xffc6bb8c),
                          color:Colors.brown,
                          child:Center(
                            child:Column(
                              children:[
                                SizedBox(height: 10,),
                                //Text("안녕하세요 :)",style: TextStyle(color: Colors.white),),
                                // IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_fill_rounded)),
                                Center(
                                  child: Text(style: TextStyle(color: Colors.white),"먼저 눈을 감고 나에게 집중해보세요\n몸 전체를 이완시키기 위해 \n천천히 깊게 숨을 들이마시고 내쉬세요"),
                                ) ,
                                IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_fill_rounded)),
//.\n지금으로부터 1,2년후 당신외 될것같은 모습과 당신이 만들게 될 긍정적인 변화를 시각화해보세요.  주위에는 누가있는지 당신의 일상생활은 어떠한지 당신이 무엇을 믿고있는지 시각화해보세요."),
                              ],),
                          ),),),
                      Container(
                        color:Colors.brown,
                        child: Expanded(
                          child: SizedBox(
                            height: 200.0,
                            child: GridView.count(
                              crossAxisCount: 2,
                              padding: const EdgeInsets.all(16.0),
                              childAspectRatio: 8.0 / 9.0,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AspectRatio(
                                        aspectRatio: 18 / 13,
                                        child: Image.network(
                                          'https://www.hanbit.co.kr/data/editor/20200219134956_vphynybz.jpg',
                                          // widget.docid['photo'],
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text("자녀의 죽음"),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, '/add');
                                                //_update(documentSnapshot);
                                              },
                                              icon: Icon(Icons.create_sharp)),
                                          IconButton(
                                            onPressed: (){
                                              Navigator.pushNamed(
                                                  context, '/firsthome');
                                            }, icon: Icon(Icons.home),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AspectRatio(
                                        aspectRatio: 18 / 13,
                                        child: Image.network(
                                          'https://www.hanbit.co.kr/data/editor/20200219134956_vphynybz.jpg',
                                          // widget.docid['photo'],
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text("부모의죽음"),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, '/addsecond');
                                                //_update(documentSnapshot);
                                              },
                                              icon: Icon(Icons.create_sharp)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),


                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AspectRatio(
                                        aspectRatio: 18 / 13,
                                        child: Image.network(
                                          'https://www.hanbit.co.kr/data/editor/20200219134956_vphynybz.jpg',
                                          // widget.docid['photo'],
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text("친구의죽음"),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, '/addthird');
                                                //_update(documentSnapshot);
                                              },
                                              icon: Icon(Icons.create_sharp)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),


                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AspectRatio(
                                        aspectRatio: 18 / 13,
                                        child: Image.network(
                                          'https://www.hanbit.co.kr/data/editor/20200219134956_vphynybz.jpg',
                                          // widget.docid['photo'],
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text("가족의죽음"),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, '/add');
                                                //_update(documentSnapshot);
                                              },
                                              icon: Icon(Icons.create_sharp)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),


                              ],

                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const Center(
                  child: Text('none'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
