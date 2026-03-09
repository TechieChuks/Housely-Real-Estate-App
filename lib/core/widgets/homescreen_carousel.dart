import 'package:flutter/material.dart';
import 'package:housely/core/widgets/Homescreen_carousel_cards.dart';

import 'package:housely/features/main_screens/home_screen/data/nearby_properties_data.dart';

class HomeScreenrecommendedCarousels extends StatelessWidget {
  const HomeScreenrecommendedCarousels({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselView(
      itemExtent: 290,
      shrinkExtent: 250,
      children: recommendedProperties.map((property) {
        return HomeScreenRecommendedCardWidget(
          title: property.title,
          location: property.location,
          price: property.price,
          duration: property.duration,
          imagePath: property.imagePath,
        );
      }).toList(),
    );
  }
}

class HomeScreenTopLocationsCarousels extends StatelessWidget {
  const HomeScreenTopLocationsCarousels({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselView(
      itemExtent: 200,
      shrinkExtent: 180,
      children: toplocations.map((toplocations) {
        return HomeScreenTopLocationsCard(
          location: toplocations.location,
          imagePath: toplocations.imagePath,
        );
      }).toList(),
    );
  }
}
