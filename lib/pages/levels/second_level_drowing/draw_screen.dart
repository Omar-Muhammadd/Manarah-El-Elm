import 'dart:io';
import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';

import 'drawing_points.dart';

class Draw extends StatefulWidget {
  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  int index = 0;
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
  double strokeWidth = 30;
  Color selectedColor = Colors.black;
  bool showBottomList = false;
  StrokeCap strokeCap = StrokeCap.round;
  List<DrawingPoints> points = [];

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      strokeCap = StrokeCap.butt;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Text(
              arabicLetters[index],
              style: ArabicTextStyle(
                arabicFont: ArabicFont.amiri,
                fontSize: 300,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade300,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      RenderBox renderBox = context.findRenderObject() as RenderBox;
                      Offset localPosition = renderBox.globalToLocal(details.globalPosition);
                      points.add(DrawingPoints(
                          points: renderBox.globalToLocal(details.globalPosition),
                          paint: Paint()
                            ..strokeCap = strokeCap
                            ..isAntiAlias = true
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth));
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      RenderBox renderBox = context.findRenderObject() as RenderBox;
                      points.add(DrawingPoints(
                          points: renderBox.globalToLocal(details.globalPosition),
                          paint: Paint()
                            ..strokeCap = strokeCap
                            ..isAntiAlias = true
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth));
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      if (points.isNotEmpty) {
                        points.add(DrawingPoints(paint: Paint(), points: Offset.infinite));
                      }
                    });
                  },
                  child: CustomPaint(
                    size: Size.infinite,
                    painter: DrawingPainter(
                      pointsList: points,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(64, 123, 255, 1),
                ),
                width: 50,
                height: 50,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      showBottomList = false;
                      points.clear();
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (index < arabicLetters.length - 1) {
                            index++;
                            showBottomList = false;
                            points.clear();
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (index > 0) {
                            index--;
                            showBottomList = false;
                            points.clear();
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
