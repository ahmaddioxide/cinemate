import 'package:cinemate/constants/api/shimmer.dart';
import 'package:cinemate/constants/assets.dart';
import 'package:cinemate/constants/extensions.dart';
import 'package:cinemate/models/movie_credits_response_model.dart';
import 'package:cinemate/providers/movie_credits_provider.dart';
import 'package:cinemate/helpers/process_image_link.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class CastList extends ConsumerWidget {
  final int movieId;

  const CastList({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieCreditProvider = ref.watch(movieCreditsProvider(movieId));
    final textTheme = context.textTheme();
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return movieCreditProvider.when(
      data: (MovieCreditsResponse credits) => SizedBox(
        height: height * 0.25,
        width: width * 0.97,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: credits.cast.length,
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
                        credits.cast[index].profilePath,
                      ),
                    ).image,
                  ),
                  SizedBox(
                    height: height * 0.01,
                    width: width * 0.3,
                  ),
                  Text(
                    credits.cast[index].name.length > 15
                        ? '${credits.cast[index].name.substring(0, 15)}...'
                        : credits.cast[index].name,
                    style: textTheme.titleSmall,
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
                    credits.cast[index].character.length > 15
                        ? '${credits.cast[index].character.substring(0, 15)}...'
                        : credits.cast[index].character,
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      error: (e, _) => Center(
        child: Text(
          'Something went wrong',
          style: textTheme.titleMedium,
        ),
      ),
      loading: () => Shimmer(
        gradient: shimmerGradient,
        child: Container(
          height: height*0.1,
          decoration: BoxDecoration(
            color: dark[800],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
