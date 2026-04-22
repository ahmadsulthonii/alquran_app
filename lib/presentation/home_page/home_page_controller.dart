import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quran_app/presentation/home_page/home_page_view.dart';

class HomePageController extends State<HomePageView> {
  static late HomePageController instance;
  late HomePageView view;
  Map<String, String>? ayatHariIni;

  @override
  void initState() {
    super.initState();
    instance = this;

    generateAyat(); //  generate ayat random
  }

  @override
  void dispose() => super.dispose();

  void generateAyat() {
    final random = Random();
    ayatHariIni = ayatList[random.nextInt(ayatList.length)];
  }

  List<Map<String, String>> ayatList = [
    {
      "arab": "إِنَّ مَعَ ٱلْعُسْرِ يُسْرًا",
      "arti": "Sesungguhnya bersama kesulitan ada kemudahan",
      "surat": "QS. Al-Insyirah: 6",
    },
    {
      "arab": "فَاذْكُرُونِي أَذْكُرْكُمْ",
      "arti": "Ingatlah Aku, maka Aku akan mengingatmu",
      "surat": "QS. Al-Baqarah: 152",
    },
    {
      "arab": "وَٱللَّهُ مَعَ ٱلصَّـٰبِرِينَ",
      "arti": "Dan Allah bersama orang-orang yang sabar",
      "surat": "QS. Al-Baqarah: 153",
    },
    {
      "arab": "لَا تَقْنَطُوا۟ مِن رَّحْمَةِ ٱللَّهِ",
      "arti": "Janganlah kamu berputus asa dari rahmat Allah",
      "surat": "QS. Az-Zumar: 53",
    },
  ];

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
