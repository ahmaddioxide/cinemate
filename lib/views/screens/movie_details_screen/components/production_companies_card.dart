import 'package:cinemate/models/production_company_model.dart';
import 'package:cinemate/services/process_image_link.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:flutter/material.dart';

@immutable
class ProductionCompaniesList extends StatelessWidget {
  List<ProductionCompany> productionCompanies;

  ProductionCompaniesList({super.key, required this.productionCompanies});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productionCompanies.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: dark[100],
            ),
            margin: const EdgeInsets.all(5),
            width: width * 0.4,
            height: height * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                      width: width * 0.3,
                      height: height * 0.1,
                      placeholder: 'assets/images/placeholder.png',
                      image: ProcessImage.processImageLink(
                        productionCompanies[index].logoPath,
                      ),
                      fit: BoxFit.contain,
                      // height: height * 0.,
                    ),
                  ),
                  Text(
                    productionCompanies[index].name,
                    style: TextStyle(
                      color: dark[900],
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
