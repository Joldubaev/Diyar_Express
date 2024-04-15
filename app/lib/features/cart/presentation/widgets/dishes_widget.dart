import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DishesWidget extends StatefulWidget {
  const DishesWidget({super.key});

  @override
  State<DishesWidget> createState() => _DishesWidgetState();
}

class _DishesWidgetState extends State<DishesWidget> {
  int counter = 1;

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
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/icons/menu_icon.svg', height: 30),
              Text(
                'Столовые приборы',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
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
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (counter > 1) {
                              setState(() {
                                counter--;
                              });
                            }
                          },
                        ),
                        Text(
                          counter.toString(),
                          style: theme.textTheme.bodyLarge,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
