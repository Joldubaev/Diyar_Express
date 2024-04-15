import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text(
          'У нас всегда вкусно и:',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
        const SizedBox(width: 20.0, height: 40.0),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 12.0,
            fontFamily: 'Horizon',
            color: AppColors.primary,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText(
                'НЕОБЫЧНОЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              RotateAnimatedText(
                'ПОЛЕЗНОЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              RotateAnimatedText(
                'СВЕЖЕЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              RotateAnimatedText(
                'ИЗЫСКАННОЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              RotateAnimatedText(
                'ПИТАТЕЛЬНОЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
            ],
            onTap: () {},
            isRepeatingAnimation: true,
            totalRepeatCount: 15,
          ),
        ),
      ],
    );
  }
}
