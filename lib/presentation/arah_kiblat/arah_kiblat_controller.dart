import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quran_app/presentation/arah_kiblat/arah_kiblat_view.dart';

class ArahKiblatController extends State<ArahKiblatView> {
  static late ArahKiblatController instance;
  late ArahKiblatView view;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      requestPermission();
    });
  }

  @override
  void dispose() => super.dispose();

  Future<void> requestPermission() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        showLocationError();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          showLocationError();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        showLocationError();
        return;
      }
    } on MissingPluginException {
      //  plugin belum siap / belum ke-link
      showLocationError();
    } catch (e) {
      showLocationError();
    }
  }

  void showLocationError() {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar(); // tutup yang lama dulu

    messenger.showSnackBar(
      SnackBar(
        content: const Text("Pastikan location aktif"),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
