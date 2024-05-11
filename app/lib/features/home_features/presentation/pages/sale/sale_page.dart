import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/home_features/presentation/home_ropsitories.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/app_colors.dart';
import 'package:diyar_express/shared/utils/snackbar/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/home_features_cubit.dart';

@RoutePage()
class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  @override
  void initState() {
    context.read<HomeFeaturesCubit>().getSales();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.router.maybePop();
            },
          ),
          title: Text(context.l10n.sales, style: const TextStyle(color: AppColors.primary))),
      body: BlocConsumer<HomeFeaturesCubit, HomeFeaturesState>(
        listener: (context, state) {
          if (state is HomeFeaturesError) {
            SnackBarMessage().showErrorSnackBar(message: state.message, context: context);
          } else if (state is HomeFeaturesLoaded) {
            SnackBarMessage().showSuccessSnackBar(message: context.l10n.dataIsLoaded, context: context);
          }
        },
        builder: (context, state) {
          if (state is HomeFeaturesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return state is HomeFeaturesLoaded
              ? ListView.builder(
                  itemCount: state.sales!.length,
                  itemBuilder: (context, index) {
                    final sale = state.sales![index];
                    return SaleWidget(
                      discount: sale.discount!,
                      title: sale.name!,
                      description: sale.description!,
                      image: sale.photoLink!,
                    );
                  },
                )
              : const SizedBox();
        },
      ),
    );
  }
}
