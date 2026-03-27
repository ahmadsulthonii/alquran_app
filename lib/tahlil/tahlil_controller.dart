import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tahlil_view.dart';

class TahlilController extends State<TahlilView> {
  List sections = []; // ✅ simpan di state

  @override
  void initState() {
    super.initState();
    loadTahlil();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tahlil")),
      body: sections.isEmpty
          ? const Center(child: CircularProgressIndicator()) // loading
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sections.length,
              itemBuilder: (context, index) {
                var section = sections[index];

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

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade100,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// TITLE
                            Text(
                              item['title'] ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            /// ARAB
                            Text(
                              item['arab'] ?? "",
                              textAlign: TextAlign.justify,
                              style: const TextStyle(fontSize: 20, height: 1.8),
                            ),

                            const SizedBox(height: 6),

                            /// LATIN
                            Text(
                              item['latin'] ?? "",
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),

                            const SizedBox(height: 6),

                            /// TRANSLATION
                            Text(
                              item['translation'] ?? "",
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      );
                    }),

                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
    );
  }
}
