import 'package:flutter/material.dart';
import 'package:quran_app/presentation/detail_surah/detail_surah_view.dart';
import 'package:quran_app/presentation/quran/quran_controller.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  Widget build(context, QuranController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(title: const Text("Al-Qur'an")),
      body: ListView.builder(
        itemCount: controller.surahList.length,
        itemBuilder: (context, index) {
          var item = controller.surahList[index];

          return ListTile(
            leading: CircleAvatar(child: Text("${item['number']}")),
            title: Text(item['name'] ?? ""),
            subtitle: Text(
              "${item['latin'] ?? ""} • ${item['totalAyat']} ayat",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailSurahView(
                    surahNumber: item['number'],
                    surahName: item['name'] ?? "",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  State<QuranView> createState() => QuranController();
}
