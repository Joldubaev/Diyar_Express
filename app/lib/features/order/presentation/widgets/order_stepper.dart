import 'package:diyar_express/theme/theme.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderStepper extends StatefulWidget {
  const OrderStepper({super.key});

  @override
  State<OrderStepper> createState() => _OrderStepperState();
}

class _OrderStepperState extends State<OrderStepper> {
  int activeStep = 0;
  int activeStep2 = 0;
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
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 15,
            child: EasyStepper(
              activeStep: activeStep2,
              maxReachedStep: reachedStep,
              lineStyle: LineStyle(
                lineLength: 58,
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
                  icon: const Icon(Icons.restaurant_menu),
                  title: 'Кухня',
                  lineText: 'Готовка еды',
                  enabled: _allowTabStepping(0, StepEnabling.sequential),
                ),
                EasyStep(
                  icon: const Icon(CupertinoIcons.car),
                  title: 'Доставка',
                  lineText: 'Курьер везет еду',
                  enabled: _allowTabStepping(1, StepEnabling.sequential),
                ),
                EasyStep(
                  icon: const Icon(Icons.check_circle_outline),
                  title: 'Доставлено',
                  lineText: 'Курьер доставил еду',
                  enabled: _allowTabStepping(2, StepEnabling.sequential),
                ),
              ],
              onStepReached: (index) => setState(
                () {
                  activeStep2 = index;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _allowTabStepping(int index, StepEnabling enabling) {
    return enabling == StepEnabling.sequential ? index <= reachedStep : reachedSteps.contains(index);
  }
}

enum StepEnabling { sequential, individual }
