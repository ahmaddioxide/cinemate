import 'package:cinemate/constants/api/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieListShimmerEffect extends StatelessWidget {
  const MovieListShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer(
                      gradient: shimmerGradient,
                      child: Container(
                        height: height* 0.25,
                        width:width*0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer(
                            gradient: shimmerGradient,
                            child: Container(
                              height: height* 0.04,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                           SizedBox(
                            height: height* 0.01,
                          ),
                          Shimmer(
                            gradient: shimmerGradient,
                            child: Container(
                              height: height* 0.02,
                              width: width*0.5,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                           SizedBox(
                            height: height* 0.01,
                          ),
                          Shimmer(
                            gradient: shimmerGradient,
                            child: Container(
                              height: height* 0.1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Shimmer(
                            gradient: shimmerGradient,
                            child: Container(
                              height: 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
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
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}
