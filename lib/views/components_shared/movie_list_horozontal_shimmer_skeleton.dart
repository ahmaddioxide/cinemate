import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cinemate/constants/api/shimmer.dart';


class HorizontalMovieListShimmerEffect extends StatelessWidget {
  const HorizontalMovieListShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 345,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.4,
                      height: height * 0.25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Shimmer(
                          direction: ShimmerDirection.ltr,
                          gradient: shimmerGradient,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      width: width * 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer(
                            // loop: 1,
                            direction: ShimmerDirection.ltr,
                            gradient: shimmerGradient,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              width: width * 0.3,
                              height: height * 0.02,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Shimmer(
                            direction: ShimmerDirection.ltr,
                            gradient: shimmerGradient,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              width: width * 0.3,
                              height: height * 0.02,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
