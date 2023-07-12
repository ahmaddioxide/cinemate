import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cinemate/constants/api/shimmer.dart';
import 'package:cinemate/views/theme/theme.dart';

class MovieDetailsScreenShimmer extends StatelessWidget {
  const MovieDetailsScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // pinned: true,
          expandedHeight: height * 0.4,
          flexibleSpace: FlexibleSpaceBar(
            title: Shimmer(
              gradient: shimmerGradient,
              child: Container(
                decoration: BoxDecoration(
                  color: dark[800],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            centerTitle: true,
            background: Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: height * 0.1,
                width: width,
                decoration: BoxDecoration(
                  color: dark[800],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                // height: height * 1.5,
                width: width,
                decoration: BoxDecoration(
                  color: dark[800],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: double.infinity),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.4,
                              height: height * 0.25,
                              decoration: BoxDecoration(
                                color: dark[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * 0.05,
                                  width: width * 0.5,
                                  decoration: BoxDecoration(
                                    color: dark[800],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  height: height * 0.03,
                                  width: width * 0.5,
                                  decoration: BoxDecoration(
                                    color: dark[800],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  height: height * 0.03,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    color: dark[800],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: height * 0.01),
                                Container(
                                  height: height * 0.03,
                                  width: width * 0.5,
                                  decoration: BoxDecoration(
                                    color: dark[800],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            color: dark[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Container(
                          height: height * 0.2,
                          decoration: BoxDecoration(
                            color: dark[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            color: dark[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Container(
                          height: height * 0.1,
                          width: width,
                          decoration: BoxDecoration(
                            color: dark[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            color: dark[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Container(
                          height: height * 0.1,
                          width: width,
                          decoration: BoxDecoration(
                            color: dark[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Container(
                          height: height * 0.03,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            color: dark[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Container(
                          height: height * 0.1,
                          width: width,
                          decoration: BoxDecoration(
                            color: dark[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Shimmer(
                        gradient: shimmerGradient,
                        child: Container(
                          height: height * 0.2,
                          width: width,
                          decoration: BoxDecoration(
                            color: dark[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
