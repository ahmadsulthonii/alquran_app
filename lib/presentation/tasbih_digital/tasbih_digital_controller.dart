import 'package:flutter/material.dart';
import 'package:quran_app/presentation/tasbih_digital/tasbih_digital_view.dart';

class TasbihDigitalController extends State<TasbihDigitalView> {
  static late TasbihDigitalController instance;
  late TasbihDigitalView view;

  int count = 0;
  int target = 33;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  void reset() {
    setState(() {
      count = 0;
    });
  }

  void changeTarget(int value) {
    setState(() {
      target = value;
      count = 0;
    });
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
