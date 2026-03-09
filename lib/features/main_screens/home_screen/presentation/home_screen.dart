import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/utils/layout.dart';
import 'package:housely/core/widgets/Homescreen_carousel_cards.dart';

import 'package:housely/core/widgets/homescreen_carousel.dart';
import 'package:housely/features/main_screens/home_screen/data/nearby_properties_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showPopularProperties() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: nearbyProperties.length,
                  itemBuilder: (context, index) {
                    final property = nearbyProperties[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: HomeScreenNearbyCardWidget(
                        title: property["title"],
                        location: property["location"],
                        price: property["price"],
                        duration: property["duration"],
                        imagePath: property["image"],
                        rating: property["rating"],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _selectedLocation = "Calabar Mun";
  final List<String> _locations = [
    "Calabar Mun",
    "Abuja",
    "Lagos",
    "Port Harcourt",
    "Enugu",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),

            /// Top Row (Label + Arrow)
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Location",
                  style: AppTextStyles.label1Medium.copyWith(
                    fontSize: 20,
                    color: AppColors.grayNeutral[400],
                  ),
                ),

                PopupMenuButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  onSelected: (String value) {
                    setState(() {
                      _selectedLocation = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return _locations.map((String location) {
                      return PopupMenuItem<String>(
                        value: location,
                        child: Text(location),
                      );
                    }).toList();
                  },
                ),
              ],
            ),

            /// Changing Text Below
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                      size: 35,
                    ),
                    Text(
                      _selectedLocation,
                      style: AppTextStyles.label1SemiBold.copyWith(
                        fontSize: 28,
                        color: AppColors.grayNeutral[800],
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        // borderRadius: BorderRadius.circular(40),
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: AppColors.grayNeutral[200]!,
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            Icon(Icons.notifications_none, size: 28),
                            Positioned(
                              left: 22,
                              bottom: 20,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        // borderRadius: BorderRadius.circular(40),
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: AppColors.grayNeutral[200]!,
                        ),
                      ),

                      child: Icon(Icons.chat_bubble_outline_rounded),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: LayoutTokens.xl),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.white,

                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 3,
                  color: AppColors.grayNeutral[200]!,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.primary[700],
                          size: 45,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Search Property",
                          style: AppTextStyles.paragraph1Regular.copyWith(
                            fontSize: 26,
                            color: AppColors.grayNeutral[400],
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.tune, color: AppColors.primary[700], size: 35),
                  ],
                ),
              ),
            ),
            SizedBox(height: 22),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                "assets/home_assets/Promo.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 130,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommendation",
                        style: AppTextStyles.paragraph1Regular.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grayNeutral[800],
                        ),
                      ),
                      Text(
                        "See all",
                        style: AppTextStyles.paragraph1Regular.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary[700],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),
                  SizedBox(
                    height: 220,
                    child: HomeScreenrecommendedCarousels(),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nearby",
                        style: AppTextStyles.paragraph1Regular.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grayNeutral[800],
                        ),
                      ),
                      Text(
                        "See all",
                        style: AppTextStyles.paragraph1Regular.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary[700],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),
                  SizedBox(
                    height: 270,
                    child: GridView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: nearbyProperties.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.4,
                          ),
                      itemBuilder: (context, index) {
                        final property = nearbyProperties[index];

                        return HomeScreenNearbyCardWidget(
                          title: property["title"],
                          location: property["location"],
                          price: property["price"],
                          duration: property["duration"],
                          imagePath: property["image"],
                          rating: property["rating"],
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Locations",
                        style: AppTextStyles.paragraph1Regular.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grayNeutral[800],
                        ),
                      ),
                      Text(
                        "See all",
                        style: AppTextStyles.paragraph1Regular.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    width: 100,
                    child: HomeScreenTopLocationsCarousels(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Populations for you",
                        style: AppTextStyles.paragraph1Regular.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grayNeutral[800],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showPopularProperties();
                        },
                        child: Text(
                          "See all",
                          style: AppTextStyles.paragraph1Regular.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 270,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: nearbyProperties.length,
                      itemBuilder: (context, index) {
                        final property = nearbyProperties[index];

                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
                            width: 200,
                            child: HomeScreenNearbyCardWidget(
                              title: property["title"],
                              location: property["location"],
                              price: property["price"],
                              duration: property["duration"],
                              imagePath: property["image"],
                              rating: property["rating"],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
