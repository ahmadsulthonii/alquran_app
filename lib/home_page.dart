import 'package:flutter/material.dart';
import 'package:quran_app/quran/quran_view.dart';
import 'package:quran_app/tahlil/tahlil_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: const Text("Qur'an"),
            leading: const Icon(Icons.menu_book),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuranView()),
              );
            },
          ),
          ListTile(
            title: const Text("Tahlil"),
            leading: const Icon(Icons.menu_book),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TahlilView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
