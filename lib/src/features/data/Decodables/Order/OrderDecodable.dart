// ignore_for_file: file_names

import '../../../../Managers/PlacesManger/Decodables/PlaceList/PlaceListDecodable.dart';
import '../DeliveryAddress/DeliveryAddressDecodable.dart';
import '../PaymentMethods/PaymentMethodsDecodable.dart';

class OrderDecodable {
  String orderId;
  PlaceDetailDecodable place;
  String userId;
  double totalAmount;
  double totalAmountToPay;
  double deliveryFee;
  double fee;
  bool needCutlery;
  String status;
  DeliveryAddressDecodable deliveryAddress;
  PaymentMethodDecodable paymentMethod;
  List<PlaceProductDecodable> products;
  String deliveryTime;
  String deliveryNotes;
  double courierTip;

  OrderDecodable(
      {required this.orderId,
      required this.place,
      required this.userId,
      required this.totalAmount,
      required this.totalAmountToPay,
      required this.deliveryFee,
      required this.fee,
      required this.needCutlery,
      required this.status,
      required this.deliveryAddress,
      required this.paymentMethod,
      required this.products,
      required this.deliveryTime,
      required this.deliveryNotes,
      required this.courierTip});

  factory OrderDecodable.fromJson(Map<String, dynamic> json) => OrderDecodable(
      orderId: json["orderId"],
      place: PlaceDetailDecodable.fromMap(json["place"]),
      userId: json["userId"],
      totalAmount: json["totalAmount"]?.toDouble(),
      totalAmountToPay: json["totalAmountToPay"]?.toDouble(),
      deliveryFee: json["deliveryFee"]?.toDouble(),
      fee: json["fee"]?.toDouble(),
      needCutlery: json["needCutlery"],
      status: json["status"],
      deliveryTime: json["deliveryTime"],
      deliveryNotes: json["deliveryNotes"],
      courierTip: json["courierTip"],
      deliveryAddress:
          DeliveryAddressDecodable.fromMap(json["deliveryAddress"]),
      paymentMethod: PaymentMethodDecodable.fromMap(json["paymentMethod"]),
      products: json["products"] == null
          ? []
          : List<PlaceProductDecodable>.from(
              json["products"]!.map((x) => PlaceProductDecodable.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "place": place,
        "userId": userId,
        "totalAmount": totalAmount,
        "totalAmountToPay": totalAmountToPay,
        "deliveryFee": deliveryFee,
        "fee": fee,
        "needCutlery": needCutlery,
        "status": status,
        "deliveryAddress": deliveryAddress.toMap(),
        "paymentMethod": paymentMethod.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "deliveryTime": deliveryTime,
        "deliveryNotes": deliveryNotes,
        "courierTip": courierTip,
      };
}
