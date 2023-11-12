import 'package:equatable/equatable.dart';

class HotelModel extends Equatable {
  final String name ;
  final num starts ;
  final num price ;
  final String currency ;
  final String image ;
  final num reviewScore ;
  final String review ;
  final String address;

  const HotelModel({
    required this.image,
    required this.name,
    required this.address,
    required this.price,
    required this.currency,
    required this.review,
    required this.reviewScore,
    required this.starts,
});

  factory HotelModel.formJson(Map<String,dynamic>json){
    return HotelModel(
      image: json['image'],
      price: json['price'],
      address: json['address'],
      name: json['name'],
      currency: json['currency'],
      reviewScore: json['review_score'],
      starts: json['starts'],
      review: json['review'],
    );
  }

  @override
  List<Object?> get props => [
    image,
    price,
    address,
    name,
    currency,
    reviewScore,
    starts,
    review,
  ];
}