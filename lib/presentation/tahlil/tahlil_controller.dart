import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tahlil_view.dart';

class TahlilController extends State<TahlilView> {
  List sections = []; // ✅ simpan di state
  bool showTranslation = true;
  bool showLatin = true;

  double arabFontSize = 20;
  double latinFontSize = 14;
  double translationFontSize = 14;

  @override
  void initState() {
    super.initState();
    loadTahlil();
  }

  void toggleTranslation() {
    showTranslation = !showTranslation;
    setState(() {});
  }

  void toggleLatin() {
    showLatin = !showLatin;
    setState(() {});
  }

  void increaseFontSize() {
    arabFontSize += 2;
    latinFontSize += 1;
    translationFontSize += 1;
    setState(() {});
  }

  void decreaseFontSize() {
    arabFontSize -= 2;
    latinFontSize -= 1;
    translationFontSize -= 1;

    if (arabFontSize < 16) arabFontSize = 16;
    if (latinFontSize < 12) latinFontSize = 12;
    if (translationFontSize < 12) translationFontSize = 12;

    setState(() {});
  }

  Future<void> loadTahlil() async {
    final String response = await rootBundle.loadString(
      'assets/tahlil/tahlil.json',
    );

    final data = json.decode(response);

    sections = data['sections']; // ✅ simpan ke state

    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
