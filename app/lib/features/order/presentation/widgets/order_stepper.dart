import 'package:diyar_express/features/history/data/model/order_status_model.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/constants/constant.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderStepper extends StatefulWidget {
  final OrderStatusModel orderStatus;
  const OrderStepper({super.key, required this.orderStatus});

  @override
  State<OrderStepper> createState() => _OrderStepperState();
}

class _OrderStepperState extends State<OrderStepper> {
  int activeStep = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.1;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    checkStep();
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 15,
            child: EasyStepper(
                activeStep: activeStep,
                maxReachedStep: reachedStep,
                lineStyle: LineStyle(
                  lineLength: 67,
                  lineType: LineType.normal,
                  unreachedLineColor: Colors.grey.withOpacity(0.5),
                  finishedLineColor: AppColors.primary,
                  activeLineColor: Colors.grey.withOpacity(0.5),
                ),
                activeStepBorderColor: AppColors.green,
                activeStepIconColor: AppColors.green,
                activeStepTextColor: AppColors.green,
                activeStepBackgroundColor: Colors.white,
                unreachedStepBackgroundColor: Colors.grey.withOpacity(0.5),
                unreachedStepBorderColor: Colors.grey.withOpacity(0.5),
                unreachedStepIconColor: Colors.grey,
                unreachedStepTextColor: Colors.grey.withOpacity(0.5),
                finishedStepBackgroundColor: AppColors.primary,
                finishedStepBorderColor: Colors.grey.withOpacity(0.5),
                finishedStepIconColor: Colors.grey,
                finishedStepTextColor: AppColors.primary,
                borderThickness: 10,
                showLoadingAnimation: false,
                steps: [
                  EasyStep(
                    icon: const Icon(Icons.timer),
                    title: context.l10n.awaiting,
                    lineText: context.l10n.confirmOrder,
                    enabled: _allowTabStepping(0, StepEnabling.sequential),
                  ),
                  EasyStep(
                    icon: const Icon(Icons.restaurant_menu),
                    title: context.l10n.kitchen,
                    lineText: context.l10n.foodIsPrepared,
                    enabled: _allowTabStepping(0, StepEnabling.sequential),
                  ),
                  EasyStep(
                    icon: const Icon(CupertinoIcons.car),
                    title: context.l10n.delivery,
                    lineText: context.l10n.deliveredText2,
                    enabled: _allowTabStepping(1, StepEnabling.sequential),
                  ),
                  EasyStep(
                    icon: const Icon(Icons.check_circle_outline),
                    title: context.l10n.delivered,
                    lineText: context.l10n.deliveredText,
                    enabled: _allowTabStepping(2, StepEnabling.sequential),
                  ),
                ],
                onStepReached: (index) {}),
          ),
        ],
      ),
    );
  }

  bool _allowTabStepping(int index, StepEnabling enabling) {
    return enabling == StepEnabling.sequential ? index <= reachedStep : reachedSteps.contains(index);
  }

  checkStep() {
    widget.orderStatus.status == AppConst.awaits
        ? activeStep = 0
        : widget.orderStatus.status == AppConst.cooked
            ? activeStep = 1
            : widget.orderStatus.status == AppConst.delivered
                ? activeStep = 2
                : widget.orderStatus.status == AppConst.finished
                    ? activeStep = 3
                    : activeStep = 0;
  }
}

enum StepEnabling { sequential, individual }
