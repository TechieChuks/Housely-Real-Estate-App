class Property {
  final String title;
  final String location;
  final String price;
  final String duration;
  final String imagePath;

  Property({
    required this.title,
    required this.location,
    required this.price,
    required this.duration,
    required this.imagePath,
  });
}

class Toplocation {
  final String location;

  final String imagePath;

  Toplocation({required this.location, required this.imagePath});
}
