import 'package:cached_network_image/cached_network_image.dart';
import 'package:diyar_express/components/product/product_counter_widget.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class ProductItemContentWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final bool? isShadowVisible;

  const ProductItemContentWidget({
    super.key,
    this.onTap,
    this.isShadowVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isShadowVisible!
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                )
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 6, right: 6, top: 0),
                child: CachedNetworkImage(
                  imageUrl: 'https://i.ibb.co/GkL25DB/ALE-1357-7.png',
                  errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.png'),
                  width: double.infinity,
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
          const SizedBox(height: 6),
          Text(
            'Лагман',
            style: theme.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: '550 гр',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                  text: ' - 200 сом',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ProductCounterWidget(isShadowVisible: isShadowVisible),
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}
