import 'package:diyar_express/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
    required this.discount,
  });

  final String title;
  final int discount;
  final String description;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(image, fit: BoxFit.cover, height: 220),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: AppColors.white, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(color: AppColors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
