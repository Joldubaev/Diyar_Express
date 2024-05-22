import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({
    required this.imagePath,
    required this.title,
    required this.onPressed,
    required this.subtitle,
    super.key,
  });
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey.withOpacity(0.2)), borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(title, style: Theme.of(context).textTheme.bodyLarge)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.phone_sharp, color: AppColors.blue),
                      const SizedBox(width: 10),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: Image.asset(imagePath, width: 60)),
          ],
        ));
  }
}
