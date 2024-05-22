import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/restaurant_model.dart';
import '../../widgets/about_us_type.dart';

@RoutePage()
class RestorantPage extends StatefulWidget {
  const RestorantPage({super.key});

  @override
  State<RestorantPage> createState() => _RestorantPageState();
}

class _RestorantPageState extends State<RestorantPage> {
  final type = AboutUsType.values;
  AboutUsModel? model;

  @override
  void initState() {
    context.read<AboutUsCubit>().getAboutUs(type: 'restoran');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(context.l10n.restaurant, style: theme.textTheme.titleLarge!.copyWith(color: AppColors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      body: BlocConsumer<AboutUsCubit, AboutUsState>(
        listener: (context, state) {
          if (state is AboutUsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is AboutUsLoaded) {
            model = state.aboutUsModel;
          }
        },
        builder: (context, state) {
          if (state is AboutUsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomAboutWidget(model: model!);
        },
      ),
    );
  }
}
