import 'package:flutter/material.dart';
import 'package:quran_app/presentation/tasbih_digital/tasbih_digital_controller.dart';

class TasbihDigitalView extends StatefulWidget {
  const TasbihDigitalView({super.key});

  Widget build(context, TasbihDigitalController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(title: const Text("Tasbih Digital")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Counter
            Text(
              "${controller.count}",
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Target
            Text(
              "Target: ${controller.target}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            // Progress
            LinearProgressIndicator(
              value: controller.count / controller.target,
              minHeight: 10,
            ),

            const SizedBox(height: 40),

            // Button Tap (Tasbih)
            Expanded(
              child: GestureDetector(
                onTap: controller.increment,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "TAP",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Buttons bawah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: controller.reset,
                  child: const Text("Reset"),
                ),
                DropdownButton<int>(
                  value: controller.target,
                  items: const [
                    DropdownMenuItem(value: 33, child: Text("33")),
                    DropdownMenuItem(value: 99, child: Text("99")),
                    DropdownMenuItem(value: 100, child: Text("100")),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      controller.changeTarget(value);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<TasbihDigitalView> createState() => TasbihDigitalController();
}
