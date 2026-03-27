import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/quran.dart' as quran;

import 'package:quran_app/detail_surah/detail_surah_view.dart';

class DetailSurahController extends State<DetailSurahView> {
  List ayatList = [];
  Map<String, String> indoTranslation = {};

  @override
  void initState() {
    super.initState();
    loadTranslation().then((_) {
      loadAyat(); // jalankan setelah JSON siap
    });
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

    ayatList = List.generate(totalAyat, (index) {
      int ayatNumber = index + 1;

      String key = "${widget.surahNumber}_$ayatNumber";

      return {
        "arab": quran.getVerse(widget.surahNumber, ayatNumber),
        "translation": indoTranslation[key] ?? "",
        "number": ayatNumber,
      };
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.surahName)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ayatList.length,
        itemBuilder: (context, index) {
          var ayat = ayatList[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// NOMOR AYAT
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 12,
                    child: Text("${ayat['number']}"),
                  ),
                ),

                const SizedBox(height: 8),

                /// ARAB
                Text(
                  ayat['arab'] ?? "",
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 22, height: 1.8),
                ),

                const SizedBox(height: 8),

                /// TERJEMAHAN
                Text(ayat['translation'] ?? ""),
              ],
            ),
          );
        },
      ),
    );
  }
}
