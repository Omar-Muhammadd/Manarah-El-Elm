// install: flutter pub add bloc
// install: flutter pub add flutter_bloc

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebaacademy/pages/bottom_nav_pages/open_learn.dart';
import 'package:tebaacademy/pages/bottom_nav_pages/open_learn_math.dart';
import 'package:tebaacademy/pages/levels/arabic/fifth_level.dart';
import 'package:tebaacademy/pages/levels/arabic/first_level.dart';
import 'package:tebaacademy/pages/levels/arabic/fourth_level.dart';
import 'package:tebaacademy/pages/levels/arabic/newlevel.dart';
import 'package:tebaacademy/pages/levels/arabic/second_level.dart';
import 'package:tebaacademy/pages/levels/math/first_level_math.dart';
import 'package:tebaacademy/pages/levels/math/fourth_level_math.dart';
import 'package:tebaacademy/pages/levels/math/second_level_math.dart';
import 'package:tebaacademy/pages/levels/math/sixth_level_math.dart';
import 'package:tebaacademy/pages/levels/arabic/third_level.dart';

import 'states.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);



  List<learnModel> learn = [
    learnModel(
      name:  'المستوى الأول',
      name1: 'قراءة الحروف',
      image:  AssetImage('assets/image/11.png'),
      page:  const firstLevel(), 
    ),


    learnModel(
      name: 'المستوى الثاني',
      name1:  'كتابة الحروف',
      image:  AssetImage( 'assets/image/جمل1.jpg'),
      page:  secondLevel(), 
    ),


    learnModel(
      name: 'المستوى الثالث',
      name1: 'اختبار الحروف',
      image:  AssetImage( 'assets/image/جمل2.jpeg'),
      page:  thirdLevel(),
    ),


      learnModel(
      name: 'المستوى الرابع',
      name1: 'كلمات',
      image:  AssetImage('assets/image/جمل3.jpg'),
      page:  Newlevel(),
    ),


    learnModel(
      name:  'المستوى الخامس',
      name1: 'جمل',
      image:  AssetImage( 'assets/image/جمل2.jpeg'),
      page:  fourthLevel(),
    ),


    
    learnModel(
      name:  'المستوى السادس',
      name1: 'اختبار الجمل',
      image:  AssetImage('assets/image/جمل3.jpg'),
      page:  fifthLevel(),
    ),
  ];



  List<learnModelMath> learnMath = [
    learnModelMath(
    nameM: 'المستوى الأول',
    name1M: 'قراءة الأرقام',
    imageM: AssetImage( 'assets/image/ارقام5.jpg'),
    pageM: firstMath(), 
    ),

    learnModelMath(
    nameM: 'المستوى الثاني',
    name1M: 'عملية الجمع',
    imageM: AssetImage('assets/image/ارقام3.jpg'),
      pageM:   SecondMath(),
    ),

    learnModelMath(
    nameM: 'المستوى الثالث',
    name1M: 'عملية الطرح',
    imageM: AssetImage('assets/image/ارقام1.jpg'),
      pageM: fourthMath(),
    ),

    learnModelMath(
    nameM: 'المستوى الرابع',
    name1M: 'عملية الضرب',
    imageM: AssetImage('assets/image/ارقام3.jpg'),
      pageM:  sixthMath(),
    ),

  ];
}


