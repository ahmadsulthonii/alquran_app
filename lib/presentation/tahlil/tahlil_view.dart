import 'package:flutter/material.dart';

import 'tahlil_controller.dart';

class TahlilView extends StatefulWidget {
  const TahlilView({super.key});

  Widget build(context, TahlilController controller) {
    //  controller.view = this;

    return Scaffold(
      // appBar: AppBar(title: const Text("Tahlil")),
      appBar: AppBar(
        title: const Text("Tahlil"),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: controller.toggleTranslation,
          ),
          IconButton(
            icon: const Icon(Icons.text_fields),
            onPressed: controller.toggleLatin,
          ),
          IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: controller.increaseFontSize,
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: controller.decreaseFontSize,
          ),
        ],
      ),
      body: controller.sections.isEmpty
          ? const Center(child: CircularProgressIndicator()) // loading
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.sections.length,
              itemBuilder: (context, index) {
                var section = controller.sections[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE SECTION
                    Text(
                      section['title'] ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// LIST ITEM
                    ...List.generate(section['items'].length, (i) {
                      var item = section['items'][i];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// TITLE
                          Text(
                            item['title'] ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 6),

                          /// ARAB
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              item['arab'] ?? "",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: controller.arabFontSize,
                                height: 1.8,
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          /// LATIN
                          if (controller.showLatin)
                            Text(
                              item['latin'] ?? "",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: controller.latinFontSize,
                              ),
                            ),
                          const SizedBox(height: 6),

                          /// TRANSLATION
                          if (controller.showTranslation)
                            Text(
                              item['translation'] ?? "",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: controller.translationFontSize,
                              ),
                            ),
                        ],
                      );
                    }),

                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
    );
  }

  @override
  State<TahlilView> createState() => TahlilController();
}
