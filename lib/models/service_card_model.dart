import 'package:book_app/app/assets_path.dart';

class ServiceCardModel {
  final String images;
  final String title;
  final String category;
  final String address;
  final String price;
  final String discountedPrice;

  ServiceCardModel({
    required this.images,
    required this.title,
    required this.category,
    required this.address,
    required this.price,
    required this.discountedPrice,
  });
}

List<ServiceCardModel> dummyServiceCardList = [
  ServiceCardModel(
    images: AssetsPath.servicePng3,
    title: 'High Quality Plumber Service ',
    category: 'Plumbing Service',
    address: 'City tower, Road : 1285, Usa',
    price: '\$2011',
    discountedPrice: '\$200',
  ),
  ServiceCardModel(
    images: AssetsPath.servicePng4,
    title: 'Doctor Consultation Services',
    category: 'Doctor',
    address: 'City tower, Road : 1285, Usa',
    price: '\$1051',
    discountedPrice: '\$999',
  ),
  ServiceCardModel(
    images: AssetsPath.servicePng3,
    title: 'High Quality Cleaning Services',
    category: 'Cleaning Service',
    address: 'City tower, Road : 1285, Usa',
    price: '\$2021',
    discountedPrice: '\$1999',
  ),
  ServiceCardModel(
    images: AssetsPath.servicePng4,
    title: 'High Quality Car Wash Service',
    category: 'Car Wash',
    address: 'City tower, Road : 1285, Usa',
    price: '\$201',
    discountedPrice: '\$199',
  ),
  ServiceCardModel(
    images: AssetsPath.servicePng4,
    title: 'High Quality Car Wash Service',
    category: 'Car Wash',
    address: 'City tower, Road : 1285, Usa',
    price: '\$201',
    discountedPrice: '\$199',
  ),
  ServiceCardModel(
    images: AssetsPath.servicePng4,
    title: 'High Quality Car Wash Service',
    category: 'Car Wash',
    address: 'City tower, Road : 1285, Usa',
    price: '\$201',
    discountedPrice: '\$199',
  ),
];
