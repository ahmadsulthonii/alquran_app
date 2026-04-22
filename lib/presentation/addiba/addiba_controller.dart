import 'package:flutter/material.dart';
import 'package:quran_app/presentation/addiba/addiba_view.dart';

class AddibaController extends State<AddibaView> {
  static late AddibaController instance;
  late AddibaView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

