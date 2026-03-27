import 'package:flutter/material.dart';
import 'package:quran_app/detail_surah/detail_surah_controller.dart';

class DetailSurahView extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  const DetailSurahView({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  @override
  State<DetailSurahView> createState() => DetailSurahController();
}
