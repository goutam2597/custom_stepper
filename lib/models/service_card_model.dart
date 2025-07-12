import 'package:book_app/app/assets_path.dart';

class ServiceCardModel {
  final String images;
  final String title;
  final String category;
  final String address;
  final String price;
  final String discountedPrice;
  final String serviceQty;
  final List<StaffModel> staffs;

  ServiceCardModel({
    required this.staffs,
    required this.images,
    required this.title,
    required this.category,
    required this.address,
    required this.price,
    required this.discountedPrice,
    required this.serviceQty,
  });
}

List<ServiceCardModel> dummyServiceCardList = [
  ServiceCardModel(
    images: AssetsPath.servicePng3,
    title: 'High Quality Plumber Service',
    category: 'Plumbing Service',
    address: 'City tower, Road : 1285, Usa',
    price: '\$2011',
    discountedPrice: '\$200',
    serviceQty: '12',
    staffs: [
      StaffModel(
        staffImage: AssetsPath.staffPng1,
        staffEmail: 'jameswayne@store.com',
        name: 'James Robert',
      ),
      StaffModel(
        staffImage: AssetsPath.staffPng2,
        staffEmail: 'plumberjane@store.com',
        name: 'Jane Watson',
      ),
    ],
  ),
  ServiceCardModel(
    images: AssetsPath.servicePng4,
    title: 'Doctor Consultation Services',
    category: 'Doctor',
    address: 'City tower, Road : 1285, Usa',
    price: '\$1051',
    discountedPrice: '\$999',
    serviceQty: '54',
    staffs: [
      StaffModel(
        staffImage: AssetsPath.staffPng2,
        staffEmail: 'ahmedmusa@store.com',
        name: 'Ahmed Musa',
      ),
      StaffModel(
        staffImage: AssetsPath.staffPng3,
        staffEmail: 'janesmith@store.com',
        name: 'Jane Smith',
      ),
    ],
  ),
  ServiceCardModel(
    images: AssetsPath.servicePng4,
    title: 'High Quality Car Wash Service',
    category: 'Car Wash',
    address: 'City tower, Road : 1285, Usa',
    price: '\$201',
    discountedPrice: '\$199',
    serviceQty: '33',
    staffs: [
      StaffModel(
        staffImage: AssetsPath.staffPng3,
        staffEmail: 'jackdaniel@store.com',
        name: 'Jack Daniel',
      ),
      StaffModel(
        staffImage: AssetsPath.staffPng4,
        staffEmail: 'robertsmith@store.com',
        name: 'Robert Smith',
      ),
    ],
  ),
];

class StaffModel {
  final String staffImage;
  final String staffEmail;
  final String name;

  StaffModel({
    required this.staffImage,
    required this.staffEmail,
    required this.name,
  });
}
