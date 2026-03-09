import 'property_model.dart';

final List<Map<String, dynamic>> nearbyProperties = [
  {
    "title": "3 Bedroom Duplex",
    "location": "Marian Road, Calabar",
    "price": "₦850,000",
    "duration": "/year",
    "image": "assets/home_assets/bgimage.png",
    "rating": 4.9,
  },
  {
    "title": "2 Bedroom Flat",
    "location": "State Housing Estate",
    "price": "₦600,000",
    "duration": "/year",
    "image": "assets/home_assets/state_housing.jpg",
    "rating": 4.7,
  },
  {
    "title": "Self Contain",
    "location": "Federal Housing",
    "price": "₦350,000",
    "duration": "/year",
    "image": "assets/home_assets/federal_housing.jpg",
    "rating": 4.2,
  },
  {
    "title": "4 Bedroom Terrace",
    "location": "Satellite Town",
    "price": "₦1,200,000",
    "duration": "/year",
    "image": "assets/home_assets/satellite_town.jpg",
    "rating": 4.8,
  },
];

List<Property> recommendedProperties = [
  Property(
    title: "3 Bedroom Duplex",
    location: "Marian Road, Calabar",
    price: "₦850,000",
    duration: "/year",
    imagePath: "assets/home_assets/bgimage.png",
  ),
  Property(
    title: "2 Bedroom Flat",
    location: "State Housing Estate, Calabar",
    price: "₦600,000",
    duration: "/year",
    imagePath: "assets/home_assets/state_housing.jpg",
  ),
  Property(
    title: "Self-Contain Apartment",
    location: "Federal Housing, Calabar",
    price: "₦350,000",
    duration: "/year",
    imagePath: "assets/home_assets/federal_housing.jpg",
  ),
  Property(
    title: "4 Bedroom Terrace Duplex",
    location: "Satellite Town, Calabar",
    price: "₦1,200,000",
    duration: "/year",
    imagePath: "assets/home_assets/satellite_town.jpg",
  ),
  Property(
    title: "Affordable Mini Flat",
    location: "Akpabuyo Road, Calabar",
    price: "₦250,000",
    duration: "/year",
    imagePath: "assets/home_assets/akpabuyo_flat.jpg",
  ),
];
List<Toplocation> toplocations = [
  Toplocation(location: "Calabar", imagePath: "assets/home_assets/bgimage.png"),
  Toplocation(
    location: "oyo",

    imagePath: "assets/home_assets/state_housing.jpg",
  ),
  Toplocation(
    location: "Lagos",

    imagePath: "assets/home_assets/federal_housing.jpg",
  ),
  Toplocation(
    location: "Port",

    imagePath: "assets/home_assets/satellite_town.jpg",
  ),
  Toplocation(
    location: "Sokoto",

    imagePath: "assets/home_assets/akpabuyo_flat.jpg",
  ),
];
