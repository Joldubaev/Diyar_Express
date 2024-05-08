import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/cart/cart.dart';
import 'package:diyar_express/features/cart/data/models/models.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:diyar_express/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

@RoutePage()
class DeliveryFormPage extends StatefulWidget {
  final List<CartItemModel> cart;
  const DeliveryFormPage({super.key, required this.cart});

  @override
  State<DeliveryFormPage> createState() => _DeliveryFormPageState();
}

class _DeliveryFormPageState extends State<DeliveryFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController(text: '+996');
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  final TextEditingController _intercomController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _entranceController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _sdachaController = TextEditingController();

  PaymentTypeDelivery _paymentType = PaymentTypeDelivery.cash;

  @override
  void dispose() {
    _phoneController.dispose();
    _addressController.dispose();
    _houseController.dispose();
    _apartmentController.dispose();
    _intercomController.dispose();
    _floorController.dispose();
    _entranceController.dispose();
    _commentController.dispose();
    _userName.dispose();
    _sdachaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is CreateOrderLoaded) {
          context.router.pushAndPopUntil(
            const MainRoute(),
            predicate: (_) => false,
          );
          showToast("Заказ успешно создан");
        } else if (state is CreateOrderError) {
          showToast("Ошибка при создании заказа", isError: true);
        }
      },
      builder: (context, state) {
        _addressController.text = context.read<OrderCubit>().address;

        return Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              CustomInputWidget(
                hintText: 'Имя',
                title: 'Ваше имя',
                controller: _userName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пожалуйста, введите ваше имя';
                  } else if (value.length < 3) {
                    return 'Имя должно содержать более трех символов.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              PhoneNumberMask(
                title: 'Номер телефона',
                hintText: '+996 (___) __-__-__',
                textController: _phoneController,
                hint: "Номер телефона",
                formatter: MaskTextInputFormatter(mask: "+996 (###) ##-##-##"),
                textInputType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пожалуйста, введите ваш номер телефона';
                  } else if (value.length < 10) {
                    return 'Номер телефона должен содержать более десяти символов.';
                  }
                  return null;
                },
              ),
              CustomInputWidget(
                trailing: TextButton(
                  onPressed: () => context.router.push(const OrderMapRoute()),
                  child: const Text('Выбрать на карте'),
                ),
                hintText: '',
                title: 'Адрес',
                controller: _addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пожалуйста, введите ваш адрес';
                  } else if (value.length < 3) {
                    return 'Адрес должен содержать более трех символов.';
                  }
                  return null;
                },
              ),
              CustomInputWidget(
                hintText: '',
                title: 'Номер дома',
                controller: _houseController,
                inputType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пожалуйста, введите номер дома';
                  } else if (value.isEmpty) {
                    return 'Номер дома должен содержать более одного символа.';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomInputWidget(
                      hintText: '',
                      title: 'Кв/Офис',
                      controller: _apartmentController,
                      inputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: CustomInputWidget(
                      hintText: '',
                      title: 'Код домофона',
                      controller: _intercomController,
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomInputWidget(
                      hintText: '',
                      title: 'Этаж',
                      controller: _floorController,
                      inputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: CustomInputWidget(
                      hintText: '',
                      title: 'Код домофона',
                      controller: _entranceController,
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              CustomInputWidget(
                hintText: '',
                title: 'Комментарий к заказу',
                controller: _commentController,
              ),
              const SizedBox(height: 10),
              Text('Способ оплаты', style: theme.textTheme.bodyMedium!),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    autofocus: true,
                    value: PaymentTypeDelivery.cash,
                    groupValue: _paymentType,
                    onChanged: (value) {
                      setState(() => _paymentType = value!);
                    },
                  ),
                  const Text('Наличными курьеру')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: PaymentTypeDelivery.card,
                    groupValue: _paymentType,
                    onChanged: (value) {
                      setState(() => _paymentType = value!);
                    },
                  ),
                  const Text('Картой курьеру (Post terminal)')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: PaymentTypeDelivery.online,
                    groupValue: _paymentType,
                    onChanged: (value) {
                      setState(() => _paymentType = value!);
                    },
                  ),
                  const Text('Онлайн оплата')
                ],
              ),
              const SizedBox(height: 10),
              CustomInputWidget(
                controller: _sdachaController,
                hintText: '',
                title: 'Сдача с',
                inputType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пожалуйста, введите сумму для сдачи';
                  } else if (value.isEmpty) {
                    return 'Сумма для сдачи должна содержать более одного символа.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              SubmitButtonWidget(
                title: 'Оформить заказ',
                bgColor: theme.primaryColor,
                isLoading: state is CreateOrderLoading,
                textStyle: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<OrderCubit>().createOrder(
                          CreateOrderModel(
                            address: _addressController.text,
                            kvOffice: _apartmentController.text,
                            comment: _commentController.text,
                            entrance: _entranceController.text,
                            floor: _floorController.text,
                            houseNumber: _houseController.text,
                            intercom: _intercomController.text,
                            paymentMethod: _paymentType.toString().split('.').last,
                            userPhone: _phoneController.text,
                            userName: _userName.text,
                            sdacha: int.tryParse(_sdachaController.text) ?? 0,
                            deliveryPrice: context.read<OrderCubit>().deliveryPrice.toInt(),
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
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

enum PaymentTypeDelivery { cash, card, online }
