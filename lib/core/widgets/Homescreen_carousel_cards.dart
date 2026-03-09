import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';

class HomeScreenRecommendedCardWidget extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String duration;
  final String imagePath;

  const HomeScreenRecommendedCardWidget({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.duration,
    required this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: 200,
        width: 290,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 🔹 Background Image
              Image.asset(imagePath, fit: BoxFit.cover),

              // 🔹 Dark Gradient Overlay (for better text visibility)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.6),
                    ],
                  ),
                ),
              ),

              // 🔹 Price Tag (Top Right)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: price,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: duration,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 🔹 Favorite Icon (Right Middle)
              Positioned(
                right: 12,
                bottom: 20,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.red, size: 18),
                ),
              ),

              // 🔹 Bottom Text Info
              Positioned(
                left: 16,
                bottom: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white70,
                          size: 14,
                        ),
                        SizedBox(width: 4),
                        Text(
                          location,
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenNearbyCardWidget extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String duration;
  final String imagePath;
  final double rating;
  const HomeScreenNearbyCardWidget({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.duration,
    required this.imagePath,
    required this.rating,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: 110,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 100,
                height: 80,
              ),
            ),

            // 🔹 Dark Gradient Overlay (for better text visibility)

            // 🔹 Price Tag (Top Right)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.grayNeutral[800],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // 🔹 Favorite Icon (Right Middle)

                // 🔹 Bottom Text Info
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.grayNeutral[500],
                      size: 14,
                    ),
                    SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(
                        color: AppColors.grayNeutral[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: price,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: duration,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: AppColors.grayNeutral[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenTopLocationsCard extends StatelessWidget {
  final String location;

  final String imagePath;

  const HomeScreenTopLocationsCard({
    super.key,
    required this.location,

    required this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: SizedBox(child: Image.asset(imagePath, fit: BoxFit.cover)),
            ),
          ),
          Text(
            location,
            style: AppTextStyles.label1SemiBold.copyWith(
              fontSize: 22,
              color: AppColors.grayNeutral[400],
            ),
          ),
        ],
      ),
    );
  }
}
