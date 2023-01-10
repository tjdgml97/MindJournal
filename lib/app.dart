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
//최종맞음
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalsh_project/first_home.dart';
import 'package:finalsh_project/1home.dart';
import 'package:finalsh_project/second.dart';
import 'package:finalsh_project/second_home.dart';
import 'package:finalsh_project/step.dart';
import 'package:finalsh_project/step1.dart';
import 'package:finalsh_project/step1_1.dart';
import 'package:finalsh_project/step2.dart';
import 'package:finalsh_project/step3.dart';
import 'package:finalsh_project/step4.dart';
import 'package:finalsh_project/step5.dart';
import 'package:finalsh_project/stephome.dart';
import 'package:finalsh_project/third.dart';
import 'package:finalsh_project/third_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import '2home.dart';
import '3home.dart';
import '4home.dart';
import 'first.dart';
import 'forth.dart';
import 'home.dart';
import 'login.dart';

// TODO: Convert ShrineApp to stateful widget (104)
class ShApp extends StatelessWidget {
  const ShApp({Key? key}) : super(key: key);
//docid: ''
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'caremind',
      theme: ThemeData(
          fontFamily: 'YeonSung',
        primaryColor:  Color(0xffECE6CC),
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color:Color(0xff6f6c61),
        ),
        backgroundColor:Color(0xffECE6CC),
        // textTheme: TextTheme(
        //   display1: TextStyle(
        //     fontSize: 30,
        //     color: Colors.deepOrange,
        //   ),
        // ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        //'/login': (BuildContext context) => const LoginPage(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => const HomePage(),
        '/add' : (BuildContext context) => const AddProduct(),
        '/addsecond' : (BuildContext context) => const AddSecond(),
        '/addthird' : (BuildContext context) => const AddThird(),
        '/addforth' : (BuildContext context) => const Home(),
        '/firsthome' : (BuildContext context) => const First_Home(),
        '/secondhome' : (BuildContext context) => const Second_Home(),
        '/thirdhome' : (BuildContext context) => const Third_Home(),
        '/step': (BuildContext context) => const StepPage(),
        '/step1page': (BuildContext context) => const Step1Page(),
        '/step2page': (BuildContext context) => const Step2Page(),
        '/step3page': (BuildContext context) => const Step3Page(),
        '/step4page': (BuildContext context) => const Step4Page(),
        '/step5page': (BuildContext context) => const Step5Page(),
        '/step1home' : (BuildContext context) => const Step1_Home(),
        '/step2home' : (BuildContext context) => const Step2_Home(),
        '/step3home' : (BuildContext context) => const Step3_Home(),
        '/step4home' : (BuildContext context) => const Step4_Home(),
        '/stephome' :(BuildContext context) => const StepHome(),
        '/step1_1page' : (BuildContext context) => const Step1_1Page(),

        // '/detail' : (BuildContext context) =>  const DetailPage(),
        // TODO: Make currentCategory field take _currentCategory (104)
        // TODO: Pass _currentCategory for frontLayer (104)
        // TODO: Change backLayer field value to CategoryMenuPage (104)
      },
      // TODO: Add a theme (103)
    );
  }
}

// TODO: Build a Shrine Theme (103)
// TODO: Build a Shrine Text Theme (103)
