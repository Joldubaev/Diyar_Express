import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diyar_express/features/home_features/presentation/home_ropsitories.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.router.maybePop();
          },
        ),
        title: const Text('Новости'),
      ),
      body: BlocConsumer<HomeFeaturesCubit, HomeFeaturesState>(
        listener: (context, state) {
          if (state is HomeFeaturesError) {
            SnackBarMessage().showErrorSnackBar(message: state.message, context: context);
          } else if (state is HomeFeaturesLoaded) {
            SnackBarMessage().showSuccessSnackBar(message: 'Данные загружены', context: context);
          }
        },
        builder: (context, state) {
          if (state is HomeFeaturesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return state is HomeFeaturesLoaded
              ? ListView.builder(
                  itemCount: state.news!.length,
                  itemBuilder: (context, index) {
                    final news = state.news![index];
                    return NewsWidget(
                      title: news.name!,
                      description: news.description!,
                      image: news.photoLink!,
                    );
                  },
                )
              : const SizedBox();
        },
      ),
    );
  }
}
