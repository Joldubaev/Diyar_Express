import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/about_us/data/models/restaurant_model.dart';
import 'package:diyar_express/features/about_us/presentation/widgets/about_us_type.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HallPage extends StatefulWidget {
  const HallPage({super.key});

  @override
  State<HallPage> createState() => _HallPageState();
}

class _HallPageState extends State<HallPage> {
  final type = AboutUsType.values;
  AboutUsModel? model;

  @override
  void initState() {
    context.read<AboutUsCubit>().getAboutUs(type: 'hall');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Залы', style: theme.textTheme.bodyLarge),
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