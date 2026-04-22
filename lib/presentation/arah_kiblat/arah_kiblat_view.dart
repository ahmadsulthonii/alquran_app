import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'arah_kiblat_controller.dart';

class ArahKiblatView extends StatefulWidget {
  const ArahKiblatView({super.key});

  Widget build(context, ArahKiblatController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(title: const Text("Arah Kiblat")),
      body: const QiblahCompass(),
    );
  }

  @override
  State<ArahKiblatView> createState() => ArahKiblatController();
}

class QiblahCompass extends StatelessWidget {
  const QiblahCompass({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, AsyncSnapshot<QiblahDirection> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final qiblahDirection = snapshot.data!;

        return Center(
          child: Transform.rotate(
            angle: (qiblahDirection.qiblah * (3.1415926535 / 180) * -1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.navigation, size: 100, color: Colors.green),
                const SizedBox(height: 20),
                Text(
                  "${qiblahDirection.qiblah.toStringAsFixed(2)}°",
                  style: const TextStyle(fontSize: 20),
                ),
                const Text("Arah Kiblat"),
              ],
            ),
          ),
        );
      },
    );
  }
}
