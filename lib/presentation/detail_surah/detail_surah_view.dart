import 'package:flutter/material.dart';
import 'package:quran_app/presentation/detail_surah/detail_surah_controller.dart';

class DetailSurahView extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  const DetailSurahView({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  Widget build(context, DetailSurahController controller) {
    // controller.view = this;

    return Scaffold(
      // appBar: AppBar(title: Text(surahName)),
      appBar: AppBar(
        title: Text(surahName),
        actions: [
          IconButton(
            icon: Icon(
              controller.isMushafMode ? Icons.view_agenda : Icons.menu_book,
            ),
            onPressed: () {
              controller.isMushafMode = !controller.isMushafMode;
              controller.setState(() {});
            },
          ),
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: controller.toggleTranslation,
          ),
          IconButton(
            icon: Icon(Icons.zoom_in),
            onPressed: controller.increaseFontSize,
          ),
          IconButton(
            icon: Icon(Icons.zoom_out),
            onPressed: controller.decreaseFontSize,
          ),
        ],
      ),
      body: controller.isMushafMode
          ? buildMushafMode(context, controller)
          : buildListMode(controller),
    );
  }

  @override
  State<DetailSurahView> createState() => DetailSurahController();
}

Widget buildMushafMode(BuildContext context, DetailSurahController controller) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: RichText(
        textAlign: TextAlign.right,
        text: TextSpan(
          children: controller.buildFullAyatSpans(), // 🔥 dynamic
          style: TextStyle(
            fontSize: controller.arabFontSize,
            height: 2,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
    ),
  );
}

Widget buildListMode(DetailSurahController controller) {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: controller.ayatList.length,
    itemBuilder: (context, index) {
      var ayat = controller.ayatList[index];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(radius: 12, child: Text("${ayat['number']}")),
          ),
          const SizedBox(height: 8),

          Text(
            ayat['arab'] ?? "",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: controller.arabFontSize,
              height: 1.8,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),

          const SizedBox(height: 8),

          if (controller.showTranslation) Text(ayat['translation'] ?? ""),
        ],
      );
    },
  );
}
