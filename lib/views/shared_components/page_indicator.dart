import 'package:cinemate/views/theme/theme.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ScrollController? scrollController;
  final Function(int)? onTap;

  const PageIndicator({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onTap,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        height: height * 0.035,
        width: width * 0.9,
        child: ListView.builder(
          controller: scrollController,
          // de
          itemCount: totalPages>100?99:totalPages,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                onTap!(i + 1);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                // height: height * 0.03,
                width: width * 0.07,
                decoration: BoxDecoration(
                  color: (i + 1) == currentPage ? dark[50] :darkAccent,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(child: Text((i + 1).toString()
                ,style: TextStyle(
                  color: (i + 1) == currentPage ? darkAccent : dark[50],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
