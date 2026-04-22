import 'package:flutter/material.dart';
import 'package:quran_app/presentation/jadwal_sholat/jadwal_sholat_controller.dart';

class JadwalSholatView extends StatefulWidget {
  const JadwalSholatView({super.key});

  Widget build(context, JadwalSholatController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(title: const Text("Jadwal Sholat"), actions: const []),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.isLoading)
              const Center(child: CircularProgressIndicator())
            else ...[
              Text(
                "Lokasi: ${controller.lokasi}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              item("Subuh", controller.jadwal?['Fajr']),
              item("Dzuhur", controller.jadwal?['Dhuhr']),
              item("Ashar", controller.jadwal?['Asr']),
              item("Maghrib", controller.jadwal?['Maghrib']),
              item("Isya", controller.jadwal?['Isha']),
            ],
          ],
        ),
      ),
    );
  }

  @override
  State<JadwalSholatView> createState() => JadwalSholatController();
}

Widget item(String title, String? time) {
  return Card(
    child: ListTile(title: Text(title), trailing: Text(time ?? "-")),
  );
}
