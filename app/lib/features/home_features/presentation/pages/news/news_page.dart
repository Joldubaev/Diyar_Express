import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/home_features/presentation/pages/widgets/custom_widget.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/home_features_cubit.dart';

@RoutePage()
class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    context.read<HomeFeaturesCubit>().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () {
            context.router.maybePop();
          },
        ),
        title: Text(context.l10n.news,
            style: GoogleFonts.aBeeZee(
              color: AppColors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            )),
      ),
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
          } else if (state is HomeFeaturesLoaded) {
            if (state.news!.isEmpty || state.news == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/cuate.png',
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      context.l10n.emptyText,
                      style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.black1),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.news!.length,
                itemBuilder: (context, index) {
                  final news = state.news![index];
                  return CardWidget(
                    title: news.name!,
                    description: news.description!,
                    image: news.photoLink!,
                  );
                },
              );
            }
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
