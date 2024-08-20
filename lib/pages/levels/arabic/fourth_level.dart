import 'package:arabic_font/arabic_font.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../math/first_level_math.dart';


Color C = const Color.fromRGBO(64, 123, 255, 1);

class fourthLevel extends StatelessWidget {
   fourthLevel({super.key});
   final List<String> arabic = [
     'رجل عاقل',
     'نور ساطع',
     'قران كريم',
     'العلم نافع',
     'القمر منير',
     'صديق وفي',
     'النجوم لامعة',
     'أطع أمك',
     'أب رحيم',
     'الشمس ساطعة',
     'ذهب راشد إلى البحر',
     'غضب المعلم من احمد',
     'عاد جدي من سفرة',
     'سكب محمد الماء على الأرض',
   ];
 
  final List<AssetSource> audio = [
    AssetSource('رجل عاقل.mp3'),
    AssetSource('نور ساطع.mp3'),
    AssetSource('قران كريم.mp3'),
    AssetSource('العلم نافع.mp3'),
    AssetSource('القمر منير.mp3'),
    AssetSource('صديق وفي.mp3'),
    AssetSource('النجوم لامعه.mp3'),
    AssetSource('اطع امك.mp3'),
    AssetSource('اب رحيم.mp3'),
    AssetSource('الشمس ساطعة.mp3'),
    AssetSource('ذهب راشد الى البحر .mp3'),
    AssetSource('غضب المعلم من محمود.mp3'),
    AssetSource('عاد جدي من سفره.mp3'),
    AssetSource('سكب محمد اللبن.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                 crossAxisSpacing: 2.0,
                 mainAxisSpacing: 7.0,
                ),
                itemCount: arabic.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          blurStyle: BlurStyle.inner,
                          spreadRadius: 0.1,
                          blurRadius: 7,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          arabic[index],
                          style: ArabicTextStyle(
                            arabicFont: ArabicFont.amiri,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: C,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        IconButton(
                                            onPressed: () {
                                              audioP.play(audio[index]);
                                            },
                                            icon: const Icon(
                                              Icons.volume_up_outlined,
                                              size: 45,
                                            ),
                                          ),
                      ],
                    ),

                    );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  // void showFullScreenDialog(BuildContext context, String letter,audio) {
  //
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         backgroundColor: Colors.white,
  //         shadowColor: Colors.white,
  //         child: Container(
  //           width: double.infinity,
  //           height: 300,
  //           child: Padding(
  //             padding: const EdgeInsets.all(20.0),
  //             child: Column(
  //               children: [
  //                 const SizedBox(height: 20),
  //                 Row(
  //                   children: [
  //                     Text(
  //                       letter,
  //                       style: ArabicTextStyle(
  //                           arabicFont: ArabicFont.amiri,
  //                           color: C,
  //                           fontSize: 70,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                     Image.asset(''),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 25),
  //                 IconButton(
  //                   onPressed: () {
  //                     audioP.play(audio);
  //                   },
  //                   icon: const Icon(
  //                     Icons.volume_up_outlined,
  //                     size: 40,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
