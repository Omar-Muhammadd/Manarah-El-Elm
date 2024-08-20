import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebaacademy/shared/cubit/cubit.dart';
import 'package:tebaacademy/shared/cubit/states.dart';


Color C = const Color.fromRGBO(64, 123, 255, 1);

class learnModel {
  String name;
  String name1;
  AssetImage image;
  Widget page;



  learnModel({
    required this.name,
    required this.name1,
    required this.image,
    required this.page,
  });
}

class OpenLearn extends StatelessWidget {
  const OpenLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context);
          return SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: Colors.grey.shade100,
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildeOpenLearn(cubit.learn[index], context,index),
                    separatorBuilder: (context, builder) =>
                    const SizedBox(height: 0),
                    itemCount: cubit.learn.length,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

Widget buildeOpenLearn (learnModel learn, context, index) =>
    BlocConsumer <AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context);
          return Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                //   // if (learn.open == 'مفتوح')
                    BoxShadow(
                      color: C.withOpacity(0.3),
                      spreadRadius: 0.2,
                      blurRadius: 7,
                      offset: const Offset(4, 7),
                    ),
                //   if (learn.open == 'مفتوح')
                    BoxShadow(
                      color: C.withOpacity(0.3),
                      spreadRadius: 0.2,
                      blurRadius: 4,
                      offset: const Offset(-4, 1),
                    ),

                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: learn.image,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            right: 15,
                          ),
                          child: Text(
                            learn.name,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              right: 15,
                              bottom: 4,
                            ),
                            child: Text(
                              learn.name1,
                              style:  TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.normal,
                                fontSize: 22,
                              ),
                            ),
                          ),

                        // Row(
                        //   children: [
                        //     // Padding(
                        //     //   padding: const EdgeInsets.only(top: 8, right: 15),
                        //     //   child: CircleAvatar(
                        //     //     radius: 5,
                        //     //     backgroundColor: learn.circle,
                        //     //   ),
                        //     // ),
                        //     const SizedBox(
                        //       width: 7,
                        //     ),
                        //     // Text(
                        //     //   learn.open,
                        //     //   style: const TextStyle(
                        //     //     fontSize: 15,
                        //     //     fontWeight: FontWeight.normal,
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                        const SizedBox(
                          height: 12,
                        ),
                        // if (learn.open == 'مفتوح')
                          Container(
                            width: double.infinity,
                            height: 41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blueAccent,
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> cubit.learn[index].page),
                                );
                              },
                              child:  Center(
                                  child: Text(
                                    'تعلم',
                                    style: ArabicTextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      arabicFont: ArabicFont.dinNextLTArabic,
                                    ),
                                  )),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
