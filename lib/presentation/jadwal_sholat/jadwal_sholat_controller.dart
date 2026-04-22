import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/presentation/jadwal_sholat/jadwal_sholat_view.dart';

class JadwalSholatController extends State<JadwalSholatView> {
  static late JadwalSholatController instance;
  late JadwalSholatView view;

  Map<String, dynamic>? jadwal;
  bool isLoading = true;
  String lokasi = "";

  @override
  void initState() {
    instance = this;
    super.initState();
    fetchJadwalByLocation();
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // cek GPS aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("GPS tidak aktif");
    }

    // cek permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Permission ditolak permanen");
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> fetchJadwalByLocation() async {
    try {
      final position = await getLocation();

      final lat = position.latitude;
      final lon = position.longitude;

      lokasi = "Lat: $lat, Lon: $lon";

      final response = await http.get(
        Uri.parse(
          "https://api.aladhan.com/v1/timings?latitude=$lat&longitude=$lon&method=11",
        ),
      );

      final data = jsonDecode(response.body);
      jadwal = data['data']['timings'];
    } catch (e) {
      log('$e');
    }

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
