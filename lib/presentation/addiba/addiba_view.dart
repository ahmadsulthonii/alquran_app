import 'package:flutter/material.dart';
import 'package:quran_app/presentation/addiba/addiba_controller.dart';

class AddibaView extends StatefulWidget {
  const AddibaView({super.key});

  Widget build(context, AddibaController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("addiba"),
        actions: const [],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }

  @override
  State<AddibaView> createState() => AddibaController();
}

