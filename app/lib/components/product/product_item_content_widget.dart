import 'package:cached_network_image/cached_network_image.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class ProductItemContentWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const ProductItemContentWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/placeholder.png'),
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
          const SizedBox(height: 8),
          Container(
            height: 35,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.remove),
                ),
                Text('1', style: theme.textTheme.bodyMedium),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}
