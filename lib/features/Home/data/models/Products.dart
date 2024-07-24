
import 'package:animal_app/features/Home/data/models/Dimensions.dart';
import 'package:animal_app/features/Home/data/models/Meta.dart';
import 'package:animal_app/features/Home/data/models/Reviews.dart';

class Products {
  final num? id;
  final String? title;
  final String? description;
  final String? category;
  final num? price;
  final num? discountPercentage;
  final num? rating;
  final num? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final num? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Reviews>? reviews;
  final String? returnPolicy;
  final num? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  Products({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] as num?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      price: json['price'] as num?,
      discountPercentage: json['discountPercentage'] as num?,
      rating: json['rating'] as num?,
      stock: json['stock'] as num?,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      brand: json['brand'] as String?,
      sku: json['sku'] as String?,
      weight: json['weight'] as num?,
      dimensions: json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null,
      warrantyInformation: json['warrantyInformation'] as String?,
      shippingInformation: json['shippingInformation'] as String?,
      availabilityStatus: json['availabilityStatus'] as String?,
      reviews: json['reviews'] != null
          ? (json['reviews'] as List<dynamic>).map((item) => Reviews.fromJson(item as Map<String, dynamic>)).toList()
          : null,
      returnPolicy: json['returnPolicy'] as String?,
      minimumOrderQuantity: json['minimumOrderQuantity'] as num?,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      thumbnail: json['thumbnail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (title != null) map['title'] = title;
    if (description != null) map['description'] = description;
    if (category != null) map['category'] = category;
    if (price != null) map['price'] = price;
    if (discountPercentage != null) map['discountPercentage'] = discountPercentage;
    if (rating != null) map['rating'] = rating;
    if (stock != null) map['stock'] = stock;
    if (tags != null) map['tags'] = tags;
    if (brand != null) map['brand'] = brand;
    if (sku != null) map['sku'] = sku;
    if (weight != null) map['weight'] = weight;
    if (dimensions != null) map['dimensions'] = dimensions?.toJson();
    if (warrantyInformation != null) map['warrantyInformation'] = warrantyInformation;
    if (shippingInformation != null) map['shippingInformation'] = shippingInformation;
    if (availabilityStatus != null) map['availabilityStatus'] = availabilityStatus;
    if (reviews != null) map['reviews'] ;
    if (returnPolicy != null) map['returnPolicy'] = returnPolicy;
    if (minimumOrderQuantity != null) map['minimumOrderQuantity'] = minimumOrderQuantity;
    if (meta != null) map['meta'];
    if (images != null) map['images'] = images;
    if (thumbnail != null) map['thumbnail'] = thumbnail;
    return map;
  }

  Products copyWith({
    num? id,
    String? title,
    String? description,
    String? category,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    num? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Reviews>? reviews,
    String? returnPolicy,
    num? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) {
    return Products(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
