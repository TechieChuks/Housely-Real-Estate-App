class OnboardingPageModel {
  final String background;
  final String foreground;
  final String title;
  final String? highlight;
  final String subtitle;

  const OnboardingPageModel({
    required this.background,
    required this.foreground,
    required this.title,
    this.highlight,
    required this.subtitle,
  });

  // Optional factory for Map -> Model (load from JSON)
  factory OnboardingPageModel.fromMap(Map<String, dynamic> map) {
    return OnboardingPageModel(
      background: map["bg"] ?? "",
      foreground: map["fg"] ?? "",
      title: map["title"] ?? "",
      highlight: map["highlight"],
      subtitle: map["subtitle"] ?? "",
    );
  }
}
