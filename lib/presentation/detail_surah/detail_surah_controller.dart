import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/presentation/detail_surah/detail_surah_view.dart';

class DetailSurahController extends State<DetailSurahView> {
  static late DetailSurahController instance;

  List ayatList = [];
  Map<String, String> indoTranslation = {};
  bool showTranslation = true;
  double arabFontSize = 22;
  double translationFontSize = 16;
  bool isMushafMode = false;
  String fullAyat = "";
  // List<TextSpan> fullAyatSpans = [];

  @override
  void initState() {
    super.initState();
    loadTranslation().then((_) {
      loadAyat(); // jalankan setelah JSON siap
    });
  }

  void toggleTranslation() {
    showTranslation = !showTranslation;
    setState(() {});
  }

  void increaseFontSize() {
    arabFontSize += 2;
    translationFontSize += 1;
    setState(() {});
  }

  void decreaseFontSize() {
    arabFontSize -= 2;
    translationFontSize -= 1;

    if (arabFontSize < 16) arabFontSize = 16;
    if (translationFontSize < 12) translationFontSize = 12;

    setState(() {});
  }

  List<TextSpan> buildFullAyatSpans() {
    int totalAyat = quran.getVerseCount(widget.surahNumber);

    List<TextSpan> spans = [];

    for (int i = 1; i <= totalAyat; i++) {
      String arab = quran.getVerse(widget.surahNumber, i);

      spans.add(
        TextSpan(
          text: "$arab ",
          style: TextStyle(
            fontSize: arabFontSize, // ✅ selalu ambil state terbaru
            height: 2,
          ),
        ),
      );

      spans.add(
        TextSpan(
          text: "﴿$i﴾ ",
          style: TextStyle(fontSize: arabFontSize - 6, color: Colors.grey),
        ),
      );
    }

    return spans;
  }

  /// LOAD JSON INDONESIA

  Future<void> loadTranslation() async {
    final String response = await rootBundle.loadString(
      'assets/translation/id.json',
    );

    final data = json.decode(response);
    indoTranslation = Map<String, String>.from(data);
  }

  /// LOAD AYAT
  void loadAyat() {
    int totalAyat = quran.getVerseCount(widget.surahNumber);

    List<TextSpan> spans = [];

    ayatList = List.generate(totalAyat, (index) {
      int i = index + 1;

      String key = "${widget.surahNumber}_$i";
      String arab = quran.getVerse(widget.surahNumber, i);

      // 🔥 ayat
      spans.add(
        TextSpan(
          text: "$arab ",
          style: TextStyle(fontSize: arabFontSize, height: 2),
        ),
      );

      // 🔥 nomor ayat (lebih kecil)
      spans.add(
        TextSpan(
          text: "﴿$i﴾ ",
          style: TextStyle(
            fontSize: arabFontSize - 8, // kecilin di sini
            color: Colors.grey,
          ),
        ),
      );

      return {
        "arab": arab,
        "translation": indoTranslation[key] ?? "",
        "number": i,
      };
    });

    // fullAyatSpans = spans;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
