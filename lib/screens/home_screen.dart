import 'package:flutter/material.dart';
import 'package:flutter_study_webtoon_app/models/webtoon_model.dart';
import 'package:flutter_study_webtoon_app/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              // children: [
              //   for (var webtoon in snapshot.data!) Text(webtoon.title)
              // ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
