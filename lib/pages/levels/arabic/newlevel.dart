import 'package:arabic_font/arabic_font.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


AudioPlayer audioP = AudioPlayer();
Color C = const Color.fromRGBO(64, 123, 255, 1);

class Newlevel extends StatefulWidget {
  const Newlevel({super.key});

  @override
  State<Newlevel> createState() => _NewlevelState();
}

class _NewlevelState extends State<Newlevel> {

  final List<String> arabicLetters = [
    'رجل',
    'أمراة',
    'نور',
    'شمس',
    'خير',
    'نهار',
    'ليل',
    'قلم',
    'ظلام',
    'تعلم',
  ];

  final List<String> L =[
    'ر   جـ   ـل',
    'أ  مـ  ـر  ا  ة',
    'نـ   ـو   ـر',
    'شـ   ـمـ   ـس',
    'خـ   ـيـ   ـر',
    'نـ   ـهـ   ـا  ر',
    'لـ   ـيـ   ـل',
    'قـ   ـلـ   ـم',
    'ظـ   ـلا   م',
    'تـ   ـعـ   ـلـ   ـم',
  ];

  final List<AssetSource> audio = [
    AssetSource('رجل.mp3'),
    AssetSource('أمراة.mp3'),
    AssetSource('نور.mp3'),
    AssetSource('شمس.mp3'),
    AssetSource('خير.mp3'),
    AssetSource('نهار.mp3'),
    AssetSource('ليل.mp3'),
    AssetSource('قلم.mp3'),
    AssetSource('ظلام.mp3'),
    AssetSource('تعلم.mp3'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  crossAxisSpacing: 7.0,
                  mainAxisSpacing: 7.0,
                ),
                itemCount: arabicLetters.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 100,
                    height: 100,
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
                    child: InkWell(
                      onTap: () {
                        audioP.play(audio[index]);
                      },
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            Text(
                              arabicLetters[index],
                              style: ArabicTextStyle(
                                arabicFont: ArabicFont.amiri,
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                color: C,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              L[index],
                              style: ArabicTextStyle(
                                arabicFont: ArabicFont.amiri,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: C,
                              ),
                            ),
                          ],
                        ),
                      ),
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

}
