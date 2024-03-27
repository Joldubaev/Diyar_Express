import 'package:cached_network_image/cached_network_image.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class CartHistoryWidgets extends StatelessWidget {
  const CartHistoryWidgets({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.counter,
    required this.imageUrl,
    this.onPressed,
  });
  final String title;
  final String subtitle;
  final int price;
  final int counter;
  final String imageUrl;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CachedNetworkImage(
                      fadeInCurve: Curves.easeIn,
                      fadeOutCurve: Curves.easeOut,
                      imageUrl: imageUrl,
                      errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.png'),
                      width: 120,
                      height: 120,
                      placeholder: (context, url) => const Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  title: const Text('Подробнее'),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Text(
                                title,
                                style: theme.textTheme.bodyMedium,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: subtitle,
                                style: theme.textTheme.bodySmall!.copyWith(color: AppColors.grey),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${price * counter} сом',
                              style: theme.textTheme.bodySmall!.copyWith(color: AppColors.green),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: HistoryButton(
                            onPressed: onPressed,
                            title: 'Повторить заказ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
