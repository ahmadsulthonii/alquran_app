import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/presentation/addiba/addiba_view.dart';
import 'package:quran_app/presentation/arah_kiblat/arah_kiblat_view.dart';
import 'package:quran_app/presentation/home_page/home_page_controller.dart';
import 'package:quran_app/presentation/jadwal_sholat/jadwal_sholat_view.dart';
import 'package:quran_app/presentation/quran/quran_view.dart';
import 'package:quran_app/presentation/tahlil/tahlil_view.dart';
import 'package:quran_app/presentation/tasbih_digital/tasbih_digital_view.dart';
import 'package:quran_app/shared/util/font_m3.dart';
import 'package:quran_app/shared/util/tanggal.dart';
import 'package:quran_app/shared/util/theme_controller.dart';
import 'package:quran_app/shared/widget/container.dart';
import 'package:quran_app/state_util.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  Widget build(context, HomePageController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Al-Qur'an Digital"),
                  Text(
                    '${formatHari(formatTglParam(DateTime.now()))}, ${formatTglIndo(formatTglParam(DateTime.now()))},',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              // CircleAvatar(child: Icon(Icons.light_mode)),
              AnimatedBuilder(
                animation: ThemeController.instance,
                builder: (context, _) {
                  return IconButton(
                    icon: Icon(
                      ThemeController.instance.isDark
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                    onPressed: () {
                      ThemeController.instance.toggleTheme();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              // height: 100,
              // width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ayat Hari Ini',
                      style: FontM3.bodyMediumEmphasized(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.ayatHariIni?['arab'] ?? "-",
                          style: FontM3.bodyMediumEmphasized(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      controller.ayatHariIni?['arti'] ?? "-",
                      style: FontM3.bodyMediumEmphasized(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      controller.ayatHariIni?['surat'] ?? "-",
                      style: FontM3.bodyMediumEmphasized(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuCard(
                  icon: Symbols.import_contacts,
                  title: "Al-Qur'an",
                  subtitle: "114 Surah",
                  avatarBgColor: Colors.green.withAlpha(50),
                  avatarIconColor: Colors.green,
                  onTap: () {
                    Get.to(QuranView());
                  },
                ),
                MenuCard(
                  icon: Symbols.schedule,
                  title: "Jadwal Sholat",
                  subtitle: "Waktu sholat",
                  avatarBgColor: Colors.blue.withAlpha(50),
                  avatarIconColor: Colors.blue,
                  onTap: () {
                    Get.to(JadwalSholatView());
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuCard(
                  icon: Symbols.favorite,
                  title: "Tahlil",
                  subtitle: "Bacaan tahlil",
                  avatarBgColor: Colors.purple.withAlpha(50),
                  avatarIconColor: Colors.purple,
                  onTap: () {
                    Get.to(TahlilView());
                  },
                ),
                MenuCard(
                  icon: Symbols.award_star,
                  title: "Addiba'i",
                  subtitle: "Solawat addiba'",
                  avatarBgColor: Colors.orange.withAlpha(50),
                  avatarIconColor: Colors.orange,
                  onTap: () {
                    Get.to(AddibaView());
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuCard(
                  icon: Symbols.cached,
                  title: "Tasbih",
                  subtitle: "Tasbih Digital",
                  avatarBgColor: Colors.deepOrange.withAlpha(50),
                  avatarIconColor: Colors.deepOrange,
                  onTap: () {
                    Get.to(TasbihDigitalView());
                  },
                ),
                MenuCard(
                  icon: Symbols.arrow_outward,
                  title: "Kiblat",
                  subtitle: "Arah kiblat",
                  avatarBgColor: Colors.amber.withAlpha(50),
                  avatarIconColor: Colors.amber,
                  onTap: () {
                    Get.to(ArahKiblatView());
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Text(
                  "Sebaik-baik kalian adalah yang mempelajari Al-Qur'an dan mengajarkanya \n (HR. Bukhori)",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<HomePageView> createState() => HomePageController();
}
