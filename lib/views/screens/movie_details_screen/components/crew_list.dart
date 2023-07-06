import 'package:cinemate/constants/assets.dart';
import 'package:cinemate/models/movie_credits_response_model.dart';
import 'package:cinemate/providers/movie_credits_provider.dart';
import 'package:cinemate/services/process_image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CrewList extends ConsumerWidget {
  final int movieId;

  const CrewList({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieCreditProvider = ref.watch(movieCreditsProvider(movieId));
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return movieCreditProvider.when(
      data: (MovieCreditsResponse credits) => SizedBox(
        height: height * 0.25,
        width: width * 0.97,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: credits.crew.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: width * 0.32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: height * 0.06,
                    backgroundImage: FadeInImage.assetNetwork(
                      placeholder: placeholder,
                      image: ProcessImage.processProfileImageLink(
                          credits.crew[index].profilePath),
                    ).image,
                  ),
                  SizedBox(
                    height: height * 0.01,
                    width: width * 0.3,
                  ),
                  Text(
                    credits.crew[index].name.length > 15
                        ? '${credits.crew[index].name.substring(0, 15)}...'
                        : credits.crew[index].name,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: width * 0.22,
                    child: const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    credits.crew[index].job.length > 15
                        ? '${credits.crew[index].job.substring(0, 15)}...'
                        : credits.crew[index].job,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      error: (e, _) => Center(
        child: Text(e.toString()),
      ),
      loading: () => const Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
