import 'package:housely/features/onboarding/data/model/onboarding_page_model.dart';

class OnboardingPagesMockData {
  static const List<OnboardingPageModel> items = [
    OnboardingPageModel(
      background: "assets/onboarding_assets/first_slide/bg1.png",
      foreground: "assets/onboarding_assets/first_slide/fg1.png",
      title: "Find the perfect place for your future house",
      highlight: "perfect place",
      subtitle:
          "find the best place for your dream house with your family and loved ones.",
    ),
    OnboardingPageModel(
      background: "assets/onboarding_assets/second_slide/bg2.png",
      foreground: "assets/onboarding_assets/second_slide/fg2.png",
      title: "Fast sell your property in just one click",
      highlight: "one click",
      subtitle:
          "Simplify the property sales process with just your smartphone.",
    ),
    OnboardingPageModel(
      background: "assets/onboarding_assets/third_slide/bg3.png",
      foreground: "assets/onboarding_assets/third_slide/fg3.png",
      title: "find your dream home with us",
      highlight: "dream home",
      subtitle:
          "Just search and select your favorite property you want to locate.",
    ),
  ];
}
