import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/cart/data/models/cart_item_model.dart';
import 'package:diyar_express/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:diyar_express/features/order/data/models/create_order_model.dart';
import 'package:diyar_express/features/order/data/models/pickup_order_model.dart';
import 'package:diyar_express/features/order/presentation/cubit/order_cubit.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/features/auth/presentation/widgets/phone_number.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:diyar_express/shared/utils/show/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PickupForm extends StatefulWidget {
  const PickupForm({super.key, required this.cart});
  final List<CartItemModel> cart;

  @override
  State<PickupForm> createState() => _PickupFormState();
}

class _PickupFormState extends State<PickupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController(text: '+996');
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is CreateOrderLoaded) {
          context.router.pushAndPopUntil(
            const MainRoute(),
            predicate: (_) => false,
          );
          showToast(context.l10n.orderIsSuccess);
        } else if (state is CreateOrderError) {
          showToast(context.l10n.someThingIsWrong, isError: true);
        }
      },
      builder: (context, state) {
        if (state is CreateOrderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CreateOrderError) {
          return Center(
            child: Text(
              context.l10n.someThingIsWrong,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red),
            ),
          );
        }
        return Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              CustomInputWidget(
                  controller: _userName,
                  hintText: context.l10n.nameExample,
                  title: context.l10n.yourName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return context.l10n.pleaseEnterName;
                    } else if (value.length < 3) {
                      return context.l10n.pleaseEnterCorrectName;
                    }
                    return null;
                  }),
              const SizedBox(height: 10),
              PhoneNumberMask(
                title: context.l10n.phone,
                hintText: '+996 (___) __-__-__',
                textController: _phoneController,
                hint: context.l10n.phone,
                formatter: MaskTextInputFormatter(mask: "+996 (###) ##-##-##"),
                textInputType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return context.l10n.pleaseEnterPhone;
                  } else if (value.length < 10) {
                    return context.l10n.pleaseEnterCorrectPhone;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomInputWidget(
                  controller: _commentController, hintText: 'Ваша еда очень вкусная ...', title: context.l10n.comment),
              const SizedBox(height: 10),
              CustomInputWidget(
                controller: _timeController,
                hintText: '18:00 | 12.12.2021',
                title: context.l10n.preparingForThe,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Text(context.l10n.orderPickupAd, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16)),
              Text(
                context.l10n.address,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              SubmitButtonWidget(
                  title: context.l10n.orderHistory,
                  bgColor: theme.primaryColor,
                  textStyle: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<OrderCubit>().getPickupOrder(
                            PickupOrderModel(
                              userPhone: _phoneController.text,
                              userName: _userName.text,
                              prepareFor: _timeController.text,
                              comment: _commentController.text,
                              price: context.read<CartCubit>().totalPrice,
                              dishesCount: context.read<CartCubit>().dishCount,
                              foods: widget.cart
                                  .map((e) => OrderFoodItem(
                                        name: e.food?.name ?? '',
                                        price: e.food?.price ?? 0,
                                        quantity: e.quantity ?? 1,
                                      ))
                                  .toList(),
                            ),
                          );
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}

enum PaymentType { cash, card, online }
