import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StepHome extends StatefulWidget {
  const StepHome({Key? key}) : super(key: key);

  @override
  State<StepHome> createState() => _StepHomeState();
}

class _StepHomeState extends State<StepHome> {
  @override
  Widget build(BuildContext context) {
    // var user_id  = FirebaseAuth.instance.currentUser?.uid;

    // CartProvider cartProvider = Provider.of<CartProvider>(context);
    // ApplicationState authProvider = Provider.of<ApplicationState>(context);
    // PostProvider postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xffECE6CC),
      appBar: AppBar(
        title: Text('감정일지'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 700,
            child: ListView(
              padding: const EdgeInsets.all(2),
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: Offset(-1, -1))
                    ],
                    color: Color(0xffECE6CC), //FFCFAA//AA6A39
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('  Step 1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(
                            '  분노연습일지',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            // color:Colors.black26,
                            child: AspectRatio(
                              aspectRatio: 10 / 2,
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/8774/8774882.png',
                                // widget.docid['photo'],
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/step1home');
                              },
                              icon: Icon(Icons.chrome_reader_mode_outlined)),
                        ],
                      ),
                      //TextButton(onPressed: (){ Navigator.pushNamed(context, '/step1page');}, child:Text("시작")),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: Offset(-1, -1))
                    ],
                    color: Color(0xffECE6CC), //FFCFAA//AA6A39
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('  Step 2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(
                            ' 감사연습',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            // color:Colors.black26,
                            child: AspectRatio(
                              aspectRatio: 10 / 2,
                              child: Image.network(
                                'https://cdn2.iconfinder.com/data/icons/multimedia-and-communication-vol-4/100/thank_you-512.png', // widget.docid['photo'],
                                // widget.docid['photo'],
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/step2home');
                              },
                              icon: Icon(Icons.chrome_reader_mode_outlined)),
                        ],
                      ),
                      //TextButton(onPressed: (){ Navigator.pushNamed(context, '/step1page');}, child:Text("시작")),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: Offset(-1, -1))
                    ],
                    color: Color(0xffECE6CC), //FFCFAA//AA6A39
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('  Step 3',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(
                            '사랑했던 사람이 내게 남긴것 기억하기',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            // color:Colors.black26,
                            child: AspectRatio(
                              aspectRatio: 10 / 2,
                              child: Image.network(
                                'https://cdn4.iconfinder.com/data/icons/48-bubbles/48/20.Photos-512.png',
                                // widget.docid['photo'],
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/step3home');
                              },
                              icon: Icon(Icons.chrome_reader_mode_outlined)),
                        ],
                      ),
                      //TextButton(onPressed: (){ Navigator.pushNamed(context, '/step1page');}, child:Text("시작")),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: Offset(-1, -1))
                    ],
                    color: Color(0xffECE6CC), //FFCFAA//AA6A39
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('  Step 4',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(
                            '죄책감이들때 대처하기',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            // color:Colors.black26,
                            child: AspectRatio(
                              aspectRatio: 10 / 2,
                              child: Image.network(
                                'https://cdn3.iconfinder.com/data/icons/medical-and-healthcare-1-4/85/heart_checkup_magnifier_cardiology_medicine_medical-512.png',
                                // widget.docid['photo'],
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/step4home');
                              },
                              icon: Icon(Icons.chrome_reader_mode_outlined)),
                        ],
                      ),
                      //TextButton(onPressed: (){ Navigator.pushNamed(context, '/step1page');}, child:Text("시작")),
                    ],
                  ),
                ),
                // Container(
                //   height: 100,
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
                //           Text('  Step 4',
                //               style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
                //           ),
                //           Text('당신에게 하고싶은말 ',
                //             style:TextStyle(fontSize: 14),
                //           ),],),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Container(
                //             width: 60,
                //             height: 60,
                //             // color:Colors.black26,
                //             child: AspectRatio(
                //               aspectRatio: 10 / 2,
                //               child: Image.network(
                //                 'https://cdn1.iconfinder.com/data/icons/actions-15/504/hug-care-love-comfort-support-1024.png',
                //                 // widget.docid['photo'],
                //                 fit: BoxFit.scaleDown,
                //               ),
                //             ),
                //           ),
                //           IconButton(onPressed: (){
                //             Navigator.pushNamed(context, '/step4home');
                //           }, icon: Icon(Icons.chrome_reader_mode_outlined)),
                //         ],
                //       ),
                //       //TextButton(onPressed: (){ Navigator.pushNamed(context, '/step1page');}, child:Text("시작")),
                //     ],                          ),
                // ),
                // ElevatedButton(onPressed: (){
                //
                //   Navigator.pop(context);
                // }, child: Text("종료하기"),
                //   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff6f6c61),),
                //     padding: MaterialStateProperty.all(
                //       EdgeInsets.fromLTRB(60,10,60,10),
                //     ),),),
              ],
            ),
          ),
          //Text(ProfileProvider.subscribingProduct.length.toString()),
          // Text(user_id.toString()),
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
                color: Color(0xff6f6c61),
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
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
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
    );
  }
}
