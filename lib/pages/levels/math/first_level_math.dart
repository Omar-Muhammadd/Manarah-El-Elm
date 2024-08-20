import 'package:arabic_font/arabic_font.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

AudioPlayer audioP = AudioPlayer();
Color C = const Color.fromRGBO(64, 123, 255, 1);

class firstMath extends StatefulWidget {
  const firstMath({super.key});

  @override
  State<firstMath> createState() => _firstLevelState();
}

class _firstLevelState extends State<firstMath> {
  final List<String> arabicLetters = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100',
    '101',
  ];
  final List<AssetSource> audio = [
    AssetSource('1.mp3'),
    AssetSource('2.mp3'),
    AssetSource('3.mp3'),
    AssetSource('4.mp3'),
    AssetSource('5.mp3'),
    AssetSource('6.mp3'),
    AssetSource('7.mp3'),
    AssetSource('8.mp3'),
    AssetSource('9.mp3'),
    AssetSource('10.mp3'),
    AssetSource('11.mp3'),
    AssetSource('12.mp3'),
    AssetSource('13.mp3'),
    AssetSource('14.mp3'),
    AssetSource('15.mp3'),
    AssetSource('16.mp3'),
    AssetSource('17.mp3'),
    AssetSource('18.mp3'),
    AssetSource('19.mp3'),
    AssetSource('20.mp3'),
    AssetSource('30.mp3'),
    AssetSource('40.mp3'),
    AssetSource('50.mp3'),
    AssetSource('60.mp3'),
    AssetSource('70.mp3'),
    AssetSource('80.mp3'),
    AssetSource('90.mp3'),
    AssetSource('100.mp3'),
    AssetSource('101.mp3'),
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
                  crossAxisCount: 4,
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
                        showFullScreenDialog(context, arabicLetters[index],audio[index]);
                      },
                      child: Center(
                        child: Text(
                          arabicLetters[index],
                          style: ArabicTextStyle(
                            arabicFont: ArabicFont.amiri,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: C, // يمكنك تغيير لون الحرف هنا
                          ),
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

  void showFullScreenDialog(BuildContext context, String letter,audio) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          child: Container(
            width: 250,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    letter,
                    style: ArabicTextStyle(
                        arabicFont: ArabicFont.amiri,
                        color: C,
                        fontSize: 100,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  IconButton(
                    onPressed: () {
                      audioP.play(audio);
                    },
                    icon: const Icon(
                      Icons.volume_up_outlined,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
