// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
// import 'package:shrine/home.dart';

String name = "";
String email = "";
String url = "";
String login_in = "";
String uid ="";
// String status_message ="I promise to take the test honestly before GOD";

// Future anony login_in = "anony";
Future<UserCredential> signInWithGoogle() async {
  login_in = "google";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // String? name = "";
  // String? email = "";
  // String? url = "";

  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();






  @override
  Widget build(BuildContext context) {
    //CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffECE6CC),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 100.0),
              Column(
                children: <Widget>[
                  const Text('감정연습일지',style: TextStyle(fontSize: 20),),
                  const Text('"마음에도 연습이 필요해요"'),

                  Container(
                    width: 180,
                    child:Lottie.network('https://assets10.lottiefiles.com/private_files/lf30_ab0lb6gs.json'),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
              const SizedBox(height: 30.0),
              // TODO: Remove filled: true values (103)
              // TextField(
              //   controller: _usernameController,
              //   decoration: const InputDecoration(
              //     filled: true,
              //     labelText: 'Username',
              //   ),
              // ),
              // const SizedBox(height: 12.0),
              // TextField(
              //   controller: _passwordController,
              //   decoration: const InputDecoration(
              //     filled: true,
              //     labelText: 'Password',
              //   ),
              //   obscureText: true,
              // ),
              // SizedBox(height: 30,),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       primary: Color(0xff6f6c61),
              //     ),
              //     onPressed: ()async{
              //       _usernameController.clear();
              //       _passwordController.clear();
              //     },
              //     child: Text("cancel")),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Color(0xff6f6c61),
              //   ),
              //   child: const Text('google LOGIN'),
              //   onPressed: () async {
              //     signInWithGoogle();
              //     print('Menu button');
              //     var data = {'name' : 'sh'};
              //     setState(() {
              //       email =FirebaseAuth.instance.currentUser!.email!;
              //       url = FirebaseAuth.instance.currentUser!.photoURL!;
              //       name = FirebaseAuth.instance.currentUser!.displayName!;
              //       uid = FirebaseAuth.instance.currentUser!.uid!;
              //     });
              //     // FirebaseFirestore.instance.collection('user').add(data).then((value) => print("save"));
              //     FirebaseFirestore.instance.collection('user')!.doc(uid)
              //         .set({"name":name,"email":email,"photourl":url,"uid":uid,"method":"google"}).then((value) => print("save"));
              //     print("click login!!!!!!");
              //     print(FirebaseAuth.instance.currentUser!.uid);
              //     //cartProvider.init();
              //     await Navigator.pushNamed(context,'/');
              //   },
              // ),
              // OverflowBar(
              //   alignment: MainAxisAlignment.center,
              //   children: <Widget>[
                  // TODO: Add a beveled rectangular border to CANCEL (103)


                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff6f6c61),
                    ),
                    child: const Text('      Google Login      ',style: TextStyle(fontSize: 20),),
                    onPressed: () async {
                      signInWithGoogle();
                      print('Menu button');
                      var data = {'name' : 'sh'};
                      setState(() {
                        email =FirebaseAuth.instance.currentUser!.email!;
                        url = FirebaseAuth.instance.currentUser!.photoURL!;
                        name = FirebaseAuth.instance.currentUser!.displayName!;
                        uid = FirebaseAuth.instance.currentUser!.uid!;
                      });
                      // FirebaseFirestore.instance.collection('user').add(data).then((value) => print("save"));
                      FirebaseFirestore.instance.collection('user')!.doc(uid)
                          .set({"name":name,"email":email,"photourl":url,"uid":uid,"method":"google"}).then((value) => print("save"));
                      print("click login!!!!!!");
                      print(FirebaseAuth.instance.currentUser!.uid);
                      //cartProvider.init();
                      await Navigator.pushNamed(context,'/');
                    },
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff6f6c61),
                      ),
                      onPressed: ()async{
                        await FirebaseAuth.instance.signInAnonymously();
                        await FirebaseFirestore.instance.collection('user')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .set({"uid":FirebaseAuth.instance.currentUser!.uid!,"method":"anony"})
                            .then((value) => print("save"));
                        //cartProvider.init();
                        if(FirebaseAuth.instance.currentUser?.uid!=null)
                          await Navigator.pushNamed(context,'/');

                        //현재 유저 아이디 들고올수있음
                        //그럼 DOC 이름을유저 아이디로 만들기때문에
                        //접근가능
                        //그럼 거기에 로그인 방식 name을 들고와서 google 이면 화면, 아니면 다른 화면 보여주기
                      },
                      child: Text("  Anonymous Login ",style: TextStyle(fontSize: 20),),
              //   ],
              // ),
            ),],
          ),
        ),
      ),
    );
  }
}



// // Copyright 2018-present the Flutter authors. All Rights Reserved.
// //
// // Licensed under the Apache License, Version 2.0 (the "License");
// // you may not use this file except in compliance with the License.
// // You may obtain a copy of the License at
// //
// // http://www.apache.org/licenses/LICENSE-2.0
// //
// // Unless required by applicable law or agreed to in writing, software
// // distributed under the License is distributed on an "AS IS" BASIS,
// // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// // See the License for the specific language governing permissions and
// // limitations under the License.
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
//
// String name = "";
// String email = "";
// String url = "";
// String login_in = "";
// String uid ="";
// String status_message ="I promise to take the test honestly before GOD";
//
// // Future anony login_in = "anony";
// Future<UserCredential> signInWithGoogle() async {
//   login_in = "google";
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   // String? name = "";
//   // String? email = "";
//   // String? url = "";
//
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
//
//
// class _LoginPageState extends State<LoginPage> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     //CartProvider cartProvider = Provider.of<CartProvider>(context);
//
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           children: <Widget>[
//             const SizedBox(height: 80.0),
//             Column(
//               children: <Widget>[
//                 Image.asset('assets/diamond.png'),
//                 const SizedBox(height: 16.0),
//                 const Text('SHRINE'),
//               ],
//             ),
//             const SizedBox(height: 120.0),
//             // TODO: Remove filled: true values (103)
//             TextField(
//               controller: _usernameController,
//               decoration: const InputDecoration(
//                 filled: true,
//                 labelText: 'Username',
//               ),
//             ),
//             const SizedBox(height: 12.0),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(
//                 filled: true,
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             OverflowBar(
//               alignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 // TODO: Add a beveled rectangular border to CANCEL (103)
//                 TextButton(
//                   child: const Text('CANCEL'),
//                   onPressed: () {
//                     _usernameController.clear();
//                     _passwordController.clear();
//                   },
//                 ),
//                 // TODO: Add an elevation to NEXT (103)
//                 // TODO: Add a beveled rectangular border to NEXT (103)AwQ2
//                 ElevatedButton(
//                   child: const Text('NEXT'),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ElevatedButton(
//                   child: const Text('google'),
//                   onPressed: () async {
//                     signInWithGoogle();
//                     print('Menu button');
//                     var data = {'name' : 'sh'};
//                     setState(() {
//                       email =FirebaseAuth.instance.currentUser!.email!;
//                       url = FirebaseAuth.instance.currentUser!.photoURL!;
//                       name = FirebaseAuth.instance.currentUser!.displayName!;
//                       uid = FirebaseAuth.instance.currentUser!.uid!;
//                     });
//                     // FirebaseFirestore.instance.collection('user').add(data).then((value) => print("save"));
//                     // FirebaseFirestore.instance.collection('user')!.doc(uid)
//                     //     .set({"name":name,"email":email,"photourl":url,"uid":uid,"status_message":status_message,"method":"google"}).then((value) => print("save"));
//                     print("click login!!!!!!");
//                     print(FirebaseAuth.instance.currentUser!.uid);
//                     //cartProvider.init();
//                     await Navigator.pushNamed(context,'/');
//                   },
//                 ),
//                 ElevatedButton(
//                     onPressed: ()async{
//                       await FirebaseAuth.instance.signInAnonymously();
//                       // await FirebaseFirestore.instance.collection('user')
//                       //     .doc(FirebaseAuth.instance.currentUser!.uid)
//                       //     .set({"uid":FirebaseAuth.instance.currentUser!.uid!,"status_message":status_message,"method":"anony"})
//                       //     .then((value) => print("save"));
//                       //cartProvider.init();
//                       if(FirebaseAuth.instance.currentUser?.uid!=null)
//                         await Navigator.pushNamed(context,'/');
//
//                       //현재 유저 아이디 들고올수있음
//                       //그럼 DOC 이름을유저 아이디로 만들기때문에
//                       //접근가능
//                       //그럼 거기에 로그인 방식 name을 들고와서 google 이면 화면, 아니면 다른 화면 보여주기
//                     },
//                     child: Text("anony")),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
