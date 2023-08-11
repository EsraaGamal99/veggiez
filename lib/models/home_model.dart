import 'package:flutter/material.dart';

class HomeModel {
  bool? status;
  DataHomeModel? data;

  //List<DataHomeModel> =[];

}

class DataHomeModel {
  List<BannerImagesModel> bannersImage = [
    BannerImagesModel(
      image: 'assets/images/banner1.png',
    ),
    BannerImagesModel(
      image: 'assets/images/banner2.png',
    ),
    BannerImagesModel(
      image: 'assets/images/banner3.png',
    ),
  ];
  List<BannerModel> banners = [
    BannerModel(
      image: 'assets/images/banner1.png',
      id: 1,
      bannerImage: 'assets/images/banner1.png',
    ),
    BannerModel(
      image: 'assets/images/banner2.png',
      id: 2,
      bannerImage: 'assets/images/banner2.png',
    ),
    BannerModel(
      image: 'assets/images/banner3.png',
      id: 3,
      bannerImage: 'assets/images/banner3.png',
    ),
  ];

  List<ProductModel> products = [
    ProductModel(
      id: 1,
      image: 'assets/images/products/carrot.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'Carrot',
      weight: '1Kg',
      price: '1Kg',
    ),
    ProductModel(
      id: 2,
      image: 'assets/images/products/meat.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'meat',
      weight: '1Kg',
      price: 200,
    ),
    ProductModel(
      id: 3,
      image: 'assets/images/products/kindpng.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'kindpng',
      weight: '1Kg',
      price: 25,
    ),
    ProductModel(
      id: 4,
      image: 'assets/images/products/pngfuel.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'pngfuel',
      weight: '1Kg',
      price: 35,
    ),
    ProductModel(
      id: 5,
      image: 'assets/images/products/pngkey.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'pngkey',
      weight: '1Kg',
      price: 45,
    ),
    ProductModel(
      id: 6,
      image: 'assets/images/products/pngwing.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'pngwing',
      weight: '1Kg',
      price: 20,
    ),
    ProductModel(
      id: 7,
      image: 'assets/images/products/Spinach.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'Spinach',
      weight: '1Kg',
      price: 60,
    ),
    ProductModel(
      id: 8,
      image: 'assets/images/products/gray.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'Gray',
      weight: '1Kg',
      price: 15,
    ),
    ProductModel(
      id: 9,
      image: 'assets/images/products/green.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'green',
      weight: '1Kg',
      price: 55,
    ),
    ProductModel(
      id: 10,
      image: 'assets/images/products/red.png',
      discount: 0,
      inCart: false,
      inFavorites: false,
      name: 'Bell Pepper Red',
      weight: '1Kg',
      price: 45,
    ),
  ];
}

class BannerModel {
  int? id;
  String? image;
  String? bannerImage = '';

  BannerModel({
    this.id,
    this.image,
    this.bannerImage,
  });
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic weight = '1Kg';
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;

  ProductModel({
    this.id,
    this.inFavorites,
    this.image,
    this.discount,
    this.inCart,
    this.name,
    this.weight,
    this.price,
  });
}

class BannerImagesModel {
  final String image;

  BannerImagesModel({
    required this.image,
  });
}
