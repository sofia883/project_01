import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

class CategoryUtils {
  static final List<Category> categories = [
    Category(name: 'Electronics', icon: Icons.phone_android),
    Category(name: 'Furniture', icon: Icons.chair),
    Category(name: 'Clothing', icon: Icons.shopping_bag),
    Category(name: 'Books', icon: Icons.book),
    Category(name: 'Sports', icon: Icons.sports_soccer),
    Category(name: 'Toys', icon: Icons.toys),
    Category(name: 'Kitchen', icon: Icons.kitchen),
    Category(name: 'Garden', icon: Icons.yard),
    Category(name: 'Automotive', icon: Icons.directions_car),
    Category(name: 'Tools', icon: Icons.build),
    Category(name: 'Music', icon: Icons.music_note),
    Category(name: 'Art', icon: Icons.palette),
    Category(name: 'Health & Beauty', icon: Icons.health_and_safety),
    Category(name: 'Baby & Kids', icon: Icons.child_care),
    Category(name: 'Collectibles', icon: Icons.collections),
    Category(name: 'Vintage', icon: Icons.history),
    Category(name: 'Home Appliances', icon: Icons.kitchen), // Consider a different icon
    Category(name: 'Travel Gear', icon: Icons.travel_explore),
    Category(name: 'DIY & Crafts', icon: Icons.handyman),
    Category(name: 'Specialty Foods', icon: Icons.fastfood),
    Category(name: 'Musical Instruments', icon: Icons.music_note),
    Category(name: 'Pet Supplies', icon: Icons.pets),
  ];
}
// lib/models/item_model.dart

class MarketplaceItem {
  final String id;
  final String userId;
  final String title;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final String condition;
  final Location location;
  final DateTime createdAt;

  MarketplaceItem({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.condition,
    required this.location,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'description': description,
    'price': price,
    'category': category,
    'imageUrl': imageUrl,
    'condition': condition,
    'location': location.toJson(),
    'createdAt': createdAt.toIso8601String(),
  };

  factory MarketplaceItem.fromJson(Map<String, dynamic> json) => MarketplaceItem(
    id: json['id'],
    userId: json['userId'],
    title: json['title'],
    description: json['description'],
    price: json['price'].toDouble(),
    category: json['category'],
    imageUrl: json['imageUrl'],
    condition: json['condition'],
    location: Location.fromJson(json['location']),
    createdAt: DateTime.parse(json['createdAt']),
  );
}

class Location {
  final String country;
  final String state;
  final String city;

  Location({
    required this.country,
    required this.state,
    required this.city,
  });

  Map<String, dynamic> toJson() => {
    'country': country,
    'state': state,
    'city': city,
  };

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    country: json['country'],
    state: json['state'],
    city: json['city'],
  );
}