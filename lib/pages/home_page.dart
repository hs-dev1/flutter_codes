import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_codes/models/news_model.dart';
import 'package:flutter_codes/providers/news_provider.dart';
import 'package:flutter_codes/widgets/news_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/search_field.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsModel news = ref.watch(newsProvider).newsModel;
    bool isLoading = ref.watch(newsProvider).isLoading;

    log(" news.articles?.length: ${news.results?.length}");

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            const SearchField(),
            // Align(
            //   alignment: Alignment.centerRight,
            //   heightFactor: 0,
            //   child: IconButton(
            //     onPressed: () {
            //     },
            //     icon: const Icon(
            //       Icons.refresh_rounded,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            if (isLoading)
              Container(
                // height: MediaQuery.of(context).size.height / 2,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: news.results?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard(article: news.results![index]);
                  },
                ),
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
