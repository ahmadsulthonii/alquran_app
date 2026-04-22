import 'package:flutter/material.dart';
import 'package:quran_app/shared/util/font_m3.dart';

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color? avatarBgColor;
  final Color? avatarIconColor;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.avatarBgColor,
    this.avatarIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.42;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size * 0.8,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: avatarBgColor ?? Colors.blue.shade100,
                child: Icon(icon, color: avatarIconColor ?? Colors.blue),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: FontM3.bodyMediumEmphasized(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(subtitle),
            ],
          ),
        ),
      ),
    );
  }
}
