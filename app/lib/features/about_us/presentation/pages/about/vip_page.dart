import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/restaurant_model.dart';
import '../../widgets/about_us_type.dart';

@RoutePage()
class VipPage extends StatefulWidget {
  const VipPage({super.key});

  @override
  State<VipPage> createState() => _VipPageState();
}

class _VipPageState extends State<VipPage> {
  final type = AboutUsType.values;
  AboutUsModel? model;

  @override
  void initState() {
    context.read<AboutUsCubit>().getAboutUs(type: 'VIP');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.vip, style: theme.textTheme.bodyLarge),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${model?.name}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${model?.description}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                // GridView.builder(
                //   shrinkWrap: true,
                //   itemCount: model!.photoLinks!.length,
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     crossAxisSpacing: 10,
                //     mainAxisSpacing: 10,
                //   ),
                //   itemBuilder: (context, index) {
                //     return Image.network(
                //       '${model!.photoLinks?[index]}',
                //       fit: BoxFit.cover,
                //     );
                //   },
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
