import 'package:arabic_font/arabic_font.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

AudioPlayer audioP = AudioPlayer();
Color C = const Color.fromRGBO(64, 123, 255, 1);

class firstLevel extends StatefulWidget {
  const firstLevel({super.key});

  @override
  State<firstLevel> createState() => _firstLevelState();
}

class _firstLevelState extends State<firstLevel> {
  final List<String> L =[
    'أ   إ   ـا',
    'بـ   ـبـ   ـب',
    'تـ   ـتـ   ـت',
    'ثـ   ـثـ   ـث',
    'جـ   ـجـ   ـج',
    'حـ   ـحـ   ـح',
    'خـ   ـخـ   ـخ',
    'د   ـد   ـد',
    'ذ   ـذ   ـذ',
    'ر   ـر   ر',
    'ز   ـز   ز',
    'سـ   ـسـ   ـس',
    'شـ   ـشـ   ـش',
    'صـ   ـصـ   ـص',
    'ضـ   ـضـ   ـض',
    'طـ   ـطـ   ـط',
    'ظـ   ـظـ   ـظ',
    'عـ   ـعـ   ـع',
    'غـ   ـغـ   ـغ',
    'فـ   ـفـ   ـف',
    'قـ   ـقـ   ـق',
    'كـ   ـكـ   ـك',
    'لـ   ـلـ   ـل',
    'مـ   ـمـ   ـم',
    'نـ   ـنـ   ـن',
    'هـ   ـهـ   ـه',
    'و   ـو  ',
    'يـ  ـيـ   ـي',
    'ئـ   ـئـ   ء',



  ];
  final List<String> arabicLetters = [
  'أ',
    'ب',
    'ت',
    'ث',
    'ج',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ك',
    'ل',
    'م',
    'ن',
    'ه',
    'و',
    'ي',
    'ء',
  ];
  final List<AssetSource> audio = [
    AssetSource('a.mp3'),
    AssetSource('ب.mp3'),
    AssetSource('ت.mp3'),
    AssetSource('ث.mp3'),
    AssetSource('ج.mp3'),
    AssetSource('ح.mp3'),
    AssetSource('خ.mp3'),
    AssetSource('د.mp3'),
    AssetSource('ذ.mp3'),
    AssetSource('ر.mp3'),
    AssetSource('ز.mp3'),
    AssetSource('س.mp3'),
    AssetSource('ش.mp3'),
    AssetSource('ص.mp3'),
    AssetSource('ض.mp3'),
    AssetSource('ط.mp3'),
    AssetSource('ظ.mp3'),
    AssetSource('ع.mp3'),
    AssetSource('غ.mp3'),
    AssetSource('ف.mp3'),
    AssetSource('ق.mp3'),
    AssetSource('ك.mp3'),
    AssetSource('ل.mp3'),
    AssetSource('م.mp3'),
    AssetSource('ن.mp3'),
    AssetSource('ه.mp3'),
    AssetSource('و.mp3'),
    AssetSource('ي.mp3'),
    AssetSource('ء.mp3'),
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
